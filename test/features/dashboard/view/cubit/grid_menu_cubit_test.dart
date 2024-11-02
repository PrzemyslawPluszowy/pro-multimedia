import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pro_multimedia/features/dashboard/data/entity/grid_menu_entity.dart';
import 'package:pro_multimedia/features/dashboard/view/cubit/grid_menu_cubit.dart';

void main() {
  group('GridMenuCubit', () {
    late GridMenuCubit cubit;
    late List<GridMenuEntity> initialMenu;
    late List<GridMenuEntity> initialGridMenu;

    setUp(() {
      // Tworzymy instancję cubita przed każdym testem
      initialGridMenu = [
        const GridMenuEntity(
          uuid: 'uuid1',
          title: 'Zaplanuj podróż',
          type: GridMenuType.small,
        ),
        const GridMenuEntity(
          uuid: 'uuid2',
          title: 'Dłuższe godziny zwiedzania muzeum',
          type: GridMenuType.image,
          imageAssetPath: 'imageAssetPath',
        ),
        const GridMenuEntity(
          uuid: 'uuid3',
          title: 'Szlaki',
          type: GridMenuType.large,
        ),
      ];
      cubit = GridMenuCubit();
      initialMenu = List<GridMenuEntity>.from(initialGridMenu);
    });

    tearDown(() {
      // Zamyka cubit po każdym teście
      cubit.close();
    });

    blocTest<GridMenuCubit, GridMenuState>(
      'zmienia heartType dla elementu o podanym uuid',
      build: () => cubit,
      seed: () => GridMenuState.loaded(initialMenu),
      act: (cubit) {
        final uuid = initialMenu.first.uuid;
        cubit.changeHeartType(uuid);
      },
      expect: () {
        final updatedMenu = List<GridMenuEntity>.from(initialMenu);
        final index = updatedMenu
            .indexWhere((element) => element.uuid == initialMenu.first.uuid);
        updatedMenu[index] = updatedMenu[index].copyWith(
          heartType: updatedMenu[index]
              .heartType
              .onTapNextType(updatedMenu[index].heartType),
        );
        return [GridMenuState.loaded(updatedMenu)];
      },
    );
  });
}
