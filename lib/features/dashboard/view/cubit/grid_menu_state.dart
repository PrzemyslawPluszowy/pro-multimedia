part of 'grid_menu_cubit.dart';

@freezed
class GridMenuState with _$GridMenuState {
  const factory GridMenuState.loaded(List<GridMenuEntity> gridMenuList) =
      _Loaded;
}
