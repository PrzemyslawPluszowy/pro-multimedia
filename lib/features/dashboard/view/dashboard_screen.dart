import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:leancode_hooks/leancode_hooks.dart';
import 'package:pro_multimedia/core/common/widgets/animated_container_helper.dart';
import 'package:pro_multimedia/core/common/widgets/video_player_widget.dart';
import 'package:pro_multimedia/core/constants_variable.dart';
import 'package:pro_multimedia/core/gen/assets.gen.dart';
import 'package:pro_multimedia/core/routing/routes_name.dart';
import 'package:pro_multimedia/features/dashboard/view/widgets/custom_app_bar.dart';
import 'package:pro_multimedia/features/dashboard/view/widgets/grid_menu/grid_menu_widget.dart';

class DashboardScreen extends HookWidget {
  DashboardScreen({super.key});

  static const bottomClosePosition = -0.72;
  static const topClosePosition = 0.4;
  static const positionOpen = 0.0;
  // GlobalKey do VideoPlayerWidget umożliwia
  // wywołanie metody `retry` w przypadku błędu
  final videoKey = GlobalKey<VideoPlayerWidgetState>();

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.sizeOf(context).height;

    // zmienna weryfikująca czy użytkownik wykonał interakcję,
    // wtedy nie przechodzi do kolejnego ekranu
    final isInteractionUser = useState(false);
    // zmienna weryfikujaca czy wystąpił błąd podczas ładowania video
    final hasError = useState(false);

    // Utworzenie instancji AnimationControllerHelper
    final animationHelper = useMemoized(() {
      return AnimationControllerHelper(
        initialDelay: ConstantsVariable.initialDelayAnimation,
        animationDuration: ConstantsVariable.animationDurationM,
        topOpenPosition: positionOpen,
        topClosePosition: -topClosePosition * screenHeight,
        bottomOpenPosition: positionOpen,
        bottomClosePosition: bottomClosePosition * screenHeight,
        onCloseCompleted: () {
          context.goNamed(
            RouteName.secondScreen,
          );
        },
      );
    });

    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Użycie widgetu AnimatedTopContainer
          AnimatedTopContainer(
            controller: animationHelper,
            child: SizedBox(
              height: screenHeight / 3,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  VideoPlayerWidget(
                    key: videoKey,
                    onErrorCallback: () {
                      hasError.value = true;
                    },
                    height: MediaQuery.sizeOf(context).height / 3,
                    onEndVideoCallback:
                        // W przypadku błędu, nie wykonuje żadnej akcji
                        hasError.value || isInteractionUser.value
                            ? () {}
                            : animationHelper.close,
                    videoAssetPath: Assets.videos.film,
                  ),
                  Positioned(
                    //padding save area
                    top: 0,
                    child: CustomAppBar(
                      type: AppBarType.onTransparent,
                      animationControllerHelper: animationHelper,
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Użycie widgetu AnimatedBottomContainer
          AnimatedBottomContainer(
            controller: animationHelper,
            child: GridMenuView(
              isInteractionUser: isInteractionUser,
              hasErrorLoadingVideo: hasError,
              onTapCloseButton: hasError.value
                  ? () {
                      // Wywołanie metody `retry`, która jest próbuje
                      // zaczytac ponowanie video
                      //z VideoPlayerWidget za pomocą GlobalKey
                      // reseteuje błąd
                      hasError.value = false;
                      videoKey.currentState?.retry();
                    }
                  // W przypadku braku błędu, zamyka dolny kontener
                  // i przechodzi do kolejnego ekranu
                  // resetuje wartość `isInteractionUser`
                  : () {
                      isInteractionUser.value = false;
                      animationHelper.close();
                    },
              maxOpenHeight: bottomClosePosition.abs(),
            ),
          ),
        ],
      ),
    );
  }
}
