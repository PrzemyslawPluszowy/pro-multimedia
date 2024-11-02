import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:pro_multimedia/core/constants_variable.dart';
import 'package:pro_multimedia/core/theme/app_sizes.dart';
import 'package:pro_multimedia/core/theme/static_colors.dart';
import 'package:pro_multimedia/core/utils/extension/context_text_theme.dart';
import 'package:pro_multimedia/core/utils/extension/string_hc.dart';
import 'package:pro_multimedia/features/dashboard/view/cubit/grid_menu_cubit.dart';
import 'package:pro_multimedia/features/dashboard/view/widgets/grid_menu/grid_item_container.dart';
import 'package:pro_multimedia/features/dashboard/view/widgets/grid_menu/half_circle_btn.dart';

typedef CallbackForCircleButton = void Function();

class GridMenuView extends StatelessWidget {
  GridMenuView({
    required this.maxOpenHeight,
    required this.onTapCloseButton,
    this.isInteractionUser,
    this.margin = Sizes.p8,
    super.key,
    this.hasErrorLoadingVideo,
  });

  final double maxOpenHeight;
  final double margin;

  // callback do guzika zamykajacego,
  // w przypadku błedu do ponownego łądowania video
  final CallbackForCircleButton onTapCloseButton;

  // zmienna informująca o błędzie ładowania video
  final ValueNotifier<bool>? hasErrorLoadingVideo;
  // zmienna informująca o interakcji użytkownika,
  //blokuje auto zamykanie po zakończeniu video
  final ValueNotifier<bool>? isInteractionUser;

  // kontroler do scrolla, informuje o interakcji użytkownika
  final scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    scrollController.addListener(() {
      isInteractionUser?.value = true;
    });
    final screenHeight = MediaQuery.sizeOf(context).height;
    final screenWidth = MediaQuery.sizeOf(context).width;
    return ClipRRect(
      borderRadius:
          const BorderRadius.vertical(top: Radius.circular(Sizes.p16)),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: margin),
        width: screenWidth,
        height: screenHeight * maxOpenHeight,
        decoration: const BoxDecoration(
          color: StaticColors.containerColor,
          borderRadius: BorderRadius.vertical(top: Radius.circular(Sizes.p16)),
        ),
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            //Grid Menu
            Positioned.fill(
              top: Sizes.p20,
              child: _gridMenu(scrollController),
            ),
            // Close/Refresh Button
            Positioned(
              left: Sizes.p16,
              right: Sizes.p16,
              child: Container(
                color: StaticColors.containerColor,
                width: screenWidth,
                height: Sizes.p40,
                child: Text(
                  'Polecane'.hardcoded,
                  style: context.textTheme.headlineSmall?.copyWith(
                    color: StaticColors.blackColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Positioned(
              right: Sizes.p48,
              child: HalfCircleButton(
                onTap: onTapCloseButton,
                hasError: hasErrorLoadingVideo ?? ValueNotifier(false),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Grid Menu
  BlocBuilder<GridMenuCubit, GridMenuState> _gridMenu(
    ScrollController scrollController,
  ) {
    const crossAxisCount = 2;
    return BlocBuilder<GridMenuCubit, GridMenuState>(
      builder: (context, state) {
        final data = state.gridMenuList;
        return Padding(
          padding: const EdgeInsets.only(
            left: Sizes.p16,
            right: Sizes.p16,
          ),
          child: MasonryGridView.builder(
            shrinkWrap: true,
            controller: scrollController,
            gridDelegate: const SliverSimpleGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: crossAxisCount,
            ),
            mainAxisSpacing: Sizes.p12,
            crossAxisSpacing: Sizes.p12,
            itemCount: data.length,
            itemBuilder: (BuildContext context, int index) {
              final menuItem = data[index];
              return GridItemContainer(
                uuid: menuItem.uuid,
                title: menuItem.title,
                type: menuItem.type,
                heartType: menuItem.heartType,
                imageAssetPath: menuItem.imageAssetPath,
              )
                  .animate(
                    delay: Duration(
                      milliseconds:
                          ConstantsVariable.animationDurationM.inMilliseconds +
                              (index * 50),
                    ),
                  )
                  .fadeIn();
            },
          ),
        );
      },
    );
  }
}
