import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:pro_multimedia/core/common/widgets/animated_container_helper.dart';
import 'package:pro_multimedia/core/theme/app_sizes.dart';
import 'package:pro_multimedia/core/theme/static_colors.dart';
import 'package:pro_multimedia/core/utils/extension/context_text_theme.dart';
import 'package:pro_multimedia/core/utils/extension/string_hc.dart';

enum AppBarType { normal, onTransparent }

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    required this.animationControllerHelper,
    this.type = AppBarType.normal,
    super.key,
  });

  final AnimationControllerHelper animationControllerHelper;
  final AppBarType type;

  @override
  Widget build(BuildContext context) {
    final color = _getAppBarTextColor();
    return Container(
      padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: Sizes.p8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Ikona zamykania w formie hamburgera
            Flexible(
              flex: 2,
              child: Align(
                alignment: Alignment.centerLeft,
                child: _buildIconButton(
                  icon: Ionicons.menu_outline,
                  onPressed: animationControllerHelper.close,
                  contextColor: color,
                ),
              ),
            ),
            // Title
            Expanded(
              flex: 4,
              child: Text(
                'Logo'.hardcoded,
                style: context.textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: color,
                ),
                textAlign: TextAlign.center,
              ),
            ),

            // Ikony serca i lupy po prawej stronie
            Flexible(
              flex: 2,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  _buildIconButton(
                    icon: Ionicons.heart_outline,
                    onPressed: () {
                      //To-do: zaimplementować akcję
                    },
                    contextColor: color,
                  ),
                  gapW4,
                  _buildIconButton(
                    icon: Ionicons.search_outline,
                    onPressed: () {
                      //To-do: zaimplementować akcję
                    },
                    contextColor: color,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Color _getAppBarTextColor() {
    return type == AppBarType.normal
        ? StaticColors.blackColor
        : StaticColors.whiteColor;
  }

  Widget _buildIconButton({
    required IconData icon,
    required VoidCallback onPressed,
    required Color contextColor,
  }) {
    return Container(
      height: Sizes.p32,
      width: Sizes.p32,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: type == AppBarType.onTransparent
            ? StaticColors.white40Color
            : Colors.transparent,
      ),
      child: IconButton(
        padding: EdgeInsets.zero,
        icon: Icon(icon, color: contextColor),
        onPressed: onPressed,
      ),
    );
  }
}
