import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pro_multimedia/features/dashboard/data/constants_data.dart';
import 'package:pro_multimedia/features/dashboard/data/entity/grid_menu_entity.dart';

part 'grid_menu_cubit.freezed.dart';
part 'grid_menu_state.dart';

class GridMenuCubit extends Cubit<GridMenuState> {
  GridMenuCubit() : super(const GridMenuState.loaded(<GridMenuEntity>[])) {
    loadGridMenu();
  }

  void loadGridMenu() {
    final gridMenu = List<GridMenuEntity>.from(initialGridMenu);
    emit(GridMenuState.loaded(gridMenu));
  }

  void changeHeartType(String uuid) {
    //tworzymy kopie defensywna listy
    final gridMenu = List<GridMenuEntity>.from(
      state.maybeWhen(
        orElse: () => <GridMenuEntity>[],
        loaded: (gridMenu) => gridMenu,
      ),
    );
    //znajdujemy element o podanym uuid
    final index = gridMenu.indexWhere((element) => element.uuid == uuid);
    //zmieniamy jego typ serca
    gridMenu[index] = gridMenu[index].copyWith(
      heartType:
          gridMenu[index].heartType.onTapNextType(gridMenu[index].heartType),
    );

    emit(GridMenuState.loaded(gridMenu));
  }
}
