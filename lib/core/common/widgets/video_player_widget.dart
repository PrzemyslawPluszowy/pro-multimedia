import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:pro_multimedia/core/constants_variable.dart';
import 'package:pro_multimedia/core/theme/app_sizes.dart';
import 'package:pro_multimedia/core/theme/static_colors.dart';
import 'package:pro_multimedia/core/utils/extension/context_text_theme.dart';
import 'package:pro_multimedia/core/utils/extension/string_hc.dart';
import 'package:video_player/video_player.dart';

/// `VideoPlayerWidget` jest widgetem, który wyświetla odtwarzacz wideo,
/// obsługuje błędy ładowania oraz umożliwia ponowne załadowanie wideo
/// przy użyciu publicznej metody `retry`.
///
/// Parametry:
/// - `onEndVideoCallback`: Funkcja wywoływana po zakończeniu wideo.
/// - `videoAssetPath`: Ścieżka do zasobu wideo.
/// - `height`: Wysokość kontenera, w którym jest wyświetlane wideo.
/// - `onErrorCallback`: Funkcja wywoływana w przypadku wystąpienia błędu.
class VideoPlayerWidget extends StatefulWidget {
  const VideoPlayerWidget({
    required this.onEndVideoCallback,
    required this.videoAssetPath,
    required this.height,
    required this.onErrorCallback,
    super.key,
  });

  final void Function() onEndVideoCallback;
  final void Function() onErrorCallback;
  final String videoAssetPath;
  final double height;

  @override
  State<VideoPlayerWidget> createState() => VideoPlayerWidgetState();
}

/// `VideoPlayerWidgetState` to klasa stanu dla `VideoPlayerWidget`,
/// która zarządza logiką inicjalizacji, błędów i powtarzania odtwarzacza.
class VideoPlayerWidgetState extends State<VideoPlayerWidget> {
  late VideoPlayerController _controller;
  bool _hasError = false;

  @override
  void initState() {
    super.initState();
    _initializeVideo();
  }

  /// Metoda `_initializeVideo` inicjalizuje kontroler wideo z zasobem
  /// wskazanym przez `videoAssetPath`. W przypadku sukcesu odtwarza wideo,
  /// w przeciwnym razie obsługuje błąd poprzez `_handleError`.
  Future<void> _initializeVideo() async {
    // Wybór losowej ścieżki wideo do testów
    _controller = VideoPlayerController.asset(
      widget.videoAssetPath,
    );

    try {
      await _controller.initialize();
      await _controller.play();
      _controller.addListener(_videoListener);
      setState(() => _hasError = false); // Resetowanie błędu po sukcesie
    } catch (e) {
      _handleError();
    }
  }

  /// Publiczna metoda `retry`, która umożliwia innym widgetom ponowne
  /// załadowanie wideo przy użyciu `GlobalKey`. Ponownie inicjalizuje wideo.
  void retry() {
    _controller
      ..removeListener(_videoListener)
      ..dispose();
    _initializeVideo();
  }

  /// Metoda `_videoListener` nasłuchuje postępu odtwarzania wideo
  /// i wywołuje `onEndVideoCallback` po jego zakończeniu.
  void _videoListener() {
    if (!_controller.value.isInitialized) return;

    final position = _controller.value.position;
    final duration = _controller.value.duration;

    if (duration > Duration.zero && position >= duration) {
      widget.onEndVideoCallback();
    }
  }

  /// Metoda `_handleError` ustawia flagę `_hasError` na `true`,
  /// sygnalizując wystąpienie błędu i wywołuje `onErrorCallback`.
  void _handleError() {
    setState(() => _hasError = true);
    widget.onErrorCallback();
  }

  @override
  void dispose() {
    _controller
      ..removeListener(_videoListener)
      ..dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_hasError) {
      return _buildErrorPlaceholder(context);
    }
    return _controller.value.isInitialized
        ? _buildVideoPlayer()
        : _buildPlaceholder();
  }

  /// Widget `_buildVideoPlayer` wyświetla odtwarzacz wideo w odpowiednich
  /// proporcjach po zakończeniu inicjalizacji.
  Widget _buildVideoPlayer() {
    return Align(
      alignment: Alignment.topCenter,
      child: SizedBox(
        height: widget.height,
        child: AspectRatio(
          aspectRatio: _controller.value.aspectRatio,
          child: VideoPlayer(_controller),
        ),
      ),
    );
  }

  /// Widget `_buildPlaceholder` jest widoczny, gdy wideo jeszcze się ładuje.
  /// Wyświetla szare tło z efektem shimmer.
  Widget _buildPlaceholder() {
    return Container(
      height: widget.height,
      width: double.infinity,
      color: StaticColors.grey,
    )
        .animate(
          onPlay: (controller) => controller.repeat(),
        )
        .shimmer(
          duration: ConstantsVariable.shimmerDuration,
        );
  }

  /// Widget `_buildErrorPlaceholder` jest wyświetlany w przypadku błędu.
  /// Wyświetla ikonę błędu oraz komunikat informujący użytkownika o problemie.
  Widget _buildErrorPlaceholder(BuildContext context) {
    return Container(
      height: widget.height,
      width: double.infinity,
      color: StaticColors.blackColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.error,
            color: StaticColors.whiteColor,
            size: Sizes.p48,
          ),
          gapH12,
          Text(
            'Nie udało się załadować wideo'.hardcoded,
            style: context.textTheme.headlineSmall?.copyWith(
              color: StaticColors.whiteColor,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
