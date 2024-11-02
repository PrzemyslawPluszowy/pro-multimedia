import 'package:flutter/material.dart';
import 'package:pro_multimedia/core/theme/app_sizes.dart';
import 'package:pro_multimedia/core/theme/static_colors.dart';
import 'package:pro_multimedia/core/utils/extension/context_text_theme.dart';
import 'package:pro_multimedia/features/dashboard/data/entity/grid_menu_entity.dart';
import 'package:pro_multimedia/features/dashboard/view/widgets/grid_menu/heart_icon.dart';

class ItemMenuWithImg extends StatelessWidget {
  const ItemMenuWithImg({
    required this.imageAssetPath,
    required this.heartType,
    required this.title,
    required this.uuid,
    super.key,
  });

  final String? imageAssetPath;
  final HeartType heartType;
  final String title;
  final String uuid;

  /// Funkcja zwracająca ikonę serca na podstawie typu.
  HeartIcon _getHeartIcon() {
    switch (heartType) {
      case HeartType.empty:
        return HeartIcon.empty(uuid);
      case HeartType.half:
        return HeartIcon.half(uuid);
      case HeartType.full:
        return HeartIcon.full(uuid);
    }
  }

  @override
  Widget build(BuildContext context) {
    /// Wysokość kontenera z obrazkiem.
    final containerHeight = MediaQuery.sizeOf(context).height / 5;

    /// Wysokość tytułu.
    final titleHeight = containerHeight / 3;

    return ClipRRect(
      borderRadius: BorderRadius.circular(Sizes.p16),
      child: Container(
        height: containerHeight,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(imageAssetPath!),
            fit: BoxFit.cover,
          ),
          color: StaticColors.grey,
        ),
        child: Stack(
          fit: StackFit.expand,
          children: [
            // Użycie widgetu  HeartIcon
            Positioned(
              top: 5,
              right: 5,
              child: _getHeartIcon(),
            ),
            //  Tytuł
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              height: titleHeight,
              child: _titleOpacityContainer(context),
            ),
          ],
        ),
      ),
    );
  }

  Container _titleOpacityContainer(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(Sizes.p8),
      color: StaticColors.black40Color,
      child: Text(
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        title,
        style: context.textTheme.bodyMedium?.copyWith(
          color: StaticColors.whiteColor,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
