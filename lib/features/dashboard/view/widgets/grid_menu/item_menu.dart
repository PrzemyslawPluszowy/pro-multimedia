import 'package:flutter/material.dart';
import 'package:pro_multimedia/core/theme/app_sizes.dart';
import 'package:pro_multimedia/core/theme/static_colors.dart';
import 'package:pro_multimedia/core/utils/extension/context_text_theme.dart';
import 'package:pro_multimedia/features/dashboard/view/widgets/grid_menu/corner_widget.dart';

class ItemMenu extends StatelessWidget {
  const ItemMenu({
    required this.title,
    required this.color,
    required this.height,
    super.key,
  });

  factory ItemMenu.small(String title, BuildContext context) {
    return ItemMenu(
      title: title,
      color: StaticColors.primaryColor,
      height: MediaQuery.sizeOf(context).height / 10,
    );
  }

  factory ItemMenu.large(String title, BuildContext context) {
    return ItemMenu(
      title: title,
      color: StaticColors.secondaryColor,
      height: MediaQuery.sizeOf(context).height / 5,
    );
  }

  final String title;
  final Color color;
  final double height;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(Sizes.p16),
      child: Container(
        height: height,
        decoration: BoxDecoration(
          color: color,
        ),
        child: Stack(
          fit: StackFit.expand,
          children: [
            const Positioned(
              top: 15,
              right: 15,
              child: CornerWidget(),
            ),
            Positioned(
              bottom: 5,
              left: 5,
              right: 0,
              child: Container(
                padding: const EdgeInsets.all(Sizes.p8),
                child: Text(
                  title,
                  style: context.textTheme.bodyMedium?.copyWith(
                    color: StaticColors.whiteColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
