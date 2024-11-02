import 'package:flutter/material.dart';
import 'package:pro_multimedia/features/dashboard/data/entity/grid_menu_entity.dart';
import 'package:pro_multimedia/features/dashboard/view/widgets/grid_menu/item_menu.dart';
import 'package:pro_multimedia/features/dashboard/view/widgets/grid_menu/item_menu_with_img.dart';

class GridItemContainer extends StatelessWidget {
  const GridItemContainer({
    required this.uuid,
    required this.title,
    required this.type,
    required this.heartType,
    this.imageAssetPath,
    super.key,
  });

  final String title;
  final String? imageAssetPath;
  final HeartType heartType;
  final GridMenuType type;
  final String uuid;

  @override
  Widget build(BuildContext context) {
    switch (type) {
      case GridMenuType.image:
        return ItemMenuWithImg(
          uuid: uuid,
          imageAssetPath: imageAssetPath,
          heartType: heartType,
          title: title,
        );
      case GridMenuType.small:
        return ItemMenu.small(title, context);
      case GridMenuType.large:
        return ItemMenu.large(title, context);
    }
  }
}
