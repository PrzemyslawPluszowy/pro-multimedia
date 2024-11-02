import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:leancode_hooks/leancode_hooks.dart';
import 'package:pro_multimedia/core/common/widgets/animated_container_helper.dart';
import 'package:pro_multimedia/core/constants_variable.dart';
import 'package:pro_multimedia/core/routing/routes_name.dart';
import 'package:pro_multimedia/features/dashboard/view/widgets/custom_app_bar.dart';
import 'package:pro_multimedia/features/dashboard/view/widgets/grid_menu/grid_menu_widget.dart';

class SecondScreen extends HookWidget {
  const SecondScreen({super.key});

  static const bootomClosePosition = -0.88;
  static const topClosePosition = -0.1;
  static const positionOpen = 0.0;

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.sizeOf(context).height;
    final animationHelper = useMemoized(() {
      return AnimationControllerHelper(
        initialDelay: ConstantsVariable.initialDelayAnimation,
        animationDuration: ConstantsVariable.animationDurationM,
        topOpenPosition: positionOpen,
        topClosePosition: topClosePosition * screenHeight,
        bottomOpenPosition: positionOpen,
        bottomClosePosition: bootomClosePosition * screenHeight,
        onCloseCompleted: () {
          context.goNamed(
            RouteName.mainScreen,
          );
        },
      );
    });

    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          AnimatedTopContainer(
            controller: animationHelper,
            child: CustomAppBar(
              animationControllerHelper: animationHelper,
            ),
          ),
          AnimatedBottomContainer(
            controller: animationHelper,
            child: GridMenuView(
              margin: 0,
              onTapCloseButton: animationHelper.close,
              maxOpenHeight: bootomClosePosition.abs(),
            ),
          ),
        ],
      ),
    );
  }
}
