import 'package:freezed_annotation/freezed_annotation.dart';

part 'grid_menu_entity.freezed.dart';

enum GridMenuType { small, large, image }

enum HeartType {
  empty,
  half,
  full;

  HeartType onTapNextType(HeartType heartType) {
    if (heartType == HeartType.empty) {
      return HeartType.half;
    } else if (heartType == HeartType.half) {
      return HeartType.full;
    } else {
      return HeartType.empty;
    }
  }
}

@freezed
abstract class GridMenuEntity with _$GridMenuEntity {
  const factory GridMenuEntity({
    required String uuid,
    required String title,
    required GridMenuType type,
    String? imageAssetPath,
    @Default(HeartType.empty) HeartType heartType,
  }) = _GridMenuEntity;
}
