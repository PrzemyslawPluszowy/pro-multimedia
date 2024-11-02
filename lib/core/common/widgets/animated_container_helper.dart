import 'dart:async';

import 'package:flutter/material.dart';

/// Definicja stanów animacji
///
/// `AnimationState` to enum zawierający dwa stany animacji:
/// - `open`: stan otwarcia animacji
/// - `close`: stan zamknięcia animacji
enum AnimationState {
  open,
  close;
}

/// Klasa kontrolera animacji
///
/// `AnimationControllerHelper` to klasa kontrolująca animacje dla
/// dwóch kontenerów (górnego i dolnego) z użyciem `StreamController`.
/// Umożliwia ustawienie opóźnienia animacji, czasu trwania oraz
/// pozycji otwarcia i zamknięcia kontenerów.
/// Dodatkowo oferuje opcjonalne callbacki, które mogą być wywołane
/// po zakończeniu animacji otwierania lub zamykania.
class AnimationControllerHelper {
  /// Konstruktor klasy AnimationControllerHelper.
  ///
  /// Przyjmuje następujące argumenty:
  /// - [initialDelay]: Czas opóźnienia przed automatycznym otwarciem animacji.
  /// - [animationDuration]: Czas trwania animacji otwierania i zamykania.
  /// - [topOpenPosition]: Docelowa pozycja otwarcia dla górnego kontenera.
  /// - [topClosePosition]: Pozycja zamknięcia dla górnego kontenera.
  /// - [bottomOpenPosition]: Docelowa pozycja otwarcia dla dolnego kontenera.
  /// - [bottomClosePosition]: Pozycja zamknięcia dla dolnego kontenera.
  /// - [onOpenCompleted]: Opcjonalny callback wywoływany
  /// po zakończeniu otwarcia.
  /// - [onCloseCompleted]: Opcjonalny callback wywoływany
  /// po zakończeniu zamknięcia.
  AnimationControllerHelper({
    required this.initialDelay,
    required this.animationDuration,
    required this.topOpenPosition,
    required this.topClosePosition,
    required this.bottomOpenPosition,
    required this.bottomClosePosition,
    this.onOpenCompleted,
    this.onCloseCompleted,
  }) {
    _controller = StreamController<AnimationState>.broadcast();
    _controller.sink.add(AnimationState.close); // Początkowy stan zamknięcia
    Future.delayed(initialDelay, open); // Automatyczne otwarcie z opóźnieniem
  }

  final Duration initialDelay;
  final Duration animationDuration;
  final double topOpenPosition;
  final double topClosePosition;
  final double bottomOpenPosition;
  final double bottomClosePosition;
  final VoidCallback? onOpenCompleted;
  final VoidCallback? onCloseCompleted;

  late final StreamController<AnimationState> _controller;

  /// Strumień `animationStream` emitujący bieżący stan animacji.
  Stream<AnimationState> get animationStream => _controller.stream;

  /// Funkcja `open` uruchamiająca animację otwierania.
  ///
  /// Zmienia stan animacji na `open` i wywołuje callback `onOpenCompleted`,
  /// jeśli został zdefiniowany, po upływie [animationDuration].
  void open() {
    _controller.sink.add(AnimationState.open);
    Future.delayed(animationDuration, () {
      if (_controller.hasListener && onOpenCompleted != null) {
        onOpenCompleted!();
      }
    });
  }

  /// Funkcja `close` uruchamiająca animację zamykania.
  ///
  /// Zmienia stan animacji na `close` i wywołuje callback `onCloseCompleted`,
  /// jeśli został zdefiniowany, po upływie [animationDuration].
  void close() {
    _controller.sink.add(AnimationState.close);
    Future.delayed(animationDuration, () {
      if (_controller.hasListener && onCloseCompleted != null) {
        onCloseCompleted!();
      }
    });
  }

  /// Funkcja `dispose` zamykająca `StreamController` i zwalniająca zasoby.
  void dispose() {
    _controller.close();
  }
}

/// Widget animujący górny kontener.
///
/// `AnimatedTopContainer` używa kontrolera animacji, aby nasłuchiwać
/// zmian stanu i odpowiednio dostosowywać swoją pozycję (`top`).
///
/// - [controller]: Instancja `AnimationControllerHelper` sterująca animacją.
/// - [child]: Zawartość, która będzie wyświetlana wewnątrz kontenera.
class AnimatedTopContainer extends StatelessWidget {
  const AnimatedTopContainer({
    required this.controller,
    required this.child,
    super.key,
  });

  final AnimationControllerHelper controller;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<AnimationState>(
      stream: controller.animationStream,
      builder: (context, snapshot) {
        final isOpen = snapshot.data == AnimationState.open;
        return AnimatedPositioned(
          duration: controller.animationDuration,
          top:
              isOpen ? controller.topOpenPosition : controller.topClosePosition,
          width: MediaQuery.of(context).size.width,
          child: child,
        );
      },
    );
  }
}

/// Widget animujący dolny kontener.
///
/// `AnimatedBottomContainer` używa kontrolera animacji, aby nasłuchiwać
/// zmian stanu i odpowiednio dostosowywać swoją pozycję (`bottom`).
///
/// - [controller]: Instancja `AnimationControllerHelper` sterująca animacją.
/// - [child]: Zawartość, która będzie wyświetlana wewnątrz kontenera.
class AnimatedBottomContainer extends StatelessWidget {
  const AnimatedBottomContainer({
    required this.controller,
    required this.child,
    super.key,
  });

  final AnimationControllerHelper controller;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<AnimationState>(
      stream: controller.animationStream,
      builder: (context, snapshot) {
        final isOpen = snapshot.data == AnimationState.open;
        return AnimatedPositioned(
          duration: controller.animationDuration,
          bottom: isOpen
              ? controller.bottomOpenPosition
              : controller.bottomClosePosition,
          width: MediaQuery.of(context).size.width,
          child: child,
        );
      },
    );
  }
}
