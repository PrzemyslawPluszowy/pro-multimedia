import 'package:pro_multimedia/core/gen/assets.gen.dart';
import 'package:pro_multimedia/features/dashboard/data/entity/grid_menu_entity.dart';
import 'package:uuid/uuid.dart';

///Obstawiam, że w realnym projekcie te dane
///byłyby zaciągane z backendu lub local storegu
///Ale w zadaniu nie było informacji na ten temat,
///jakby zaszła  taka potrzeba mogę zasymulować taką logike
///lub zaimplementowac lokal storage

final List<GridMenuEntity> initialGridMenu = [
  GridMenuEntity(
    uuid: const Uuid().v4(),
    title: 'Zaplanuj podróż',
    type: GridMenuType.small,
  ),
  GridMenuEntity(
    uuid: const Uuid().v4(),
    title: 'Dłuższe godziny zwiedzania muzeum',
    type: GridMenuType.image,
    imageAssetPath: Assets.images.italy.path,
  ),
  GridMenuEntity(
    uuid: const Uuid().v4(),
    title: 'Szlaki',
    type: GridMenuType.large,
  ),
  GridMenuEntity(
    uuid: const Uuid().v4(),
    title: 'Carbonerum dla licealistów',
    type: GridMenuType.image,
    imageAssetPath: Assets.images.image4.path,
  ),
  GridMenuEntity(
    uuid: const Uuid().v4(),
    title: 'Dłuższe godziny zwiedzania muzeum',
    type: GridMenuType.image,
    imageAssetPath: Assets.images.image1.path,
    heartType: HeartType.half,
  ),
  GridMenuEntity(
    uuid: const Uuid().v4(),
    title: 'Carbonerum nie dla licealistów',
    type: GridMenuType.image,
    imageAssetPath: Assets.images.image2.path,
    heartType: HeartType.full,
  ),
  GridMenuEntity(
    uuid: const Uuid().v4(),
    title: 'Carbonerum dla licealistów',
    type: GridMenuType.image,
    imageAssetPath: Assets.images.image3.path,
  ),
  GridMenuEntity(
    uuid: const Uuid().v4(),
    title: 'Carbonerum  nie dla licealistów',
    type: GridMenuType.image,
    imageAssetPath: Assets.images.image4.path,
    heartType: HeartType.half,
  ),
  GridMenuEntity(
    uuid: const Uuid().v4(),
    title: 'Carbonerum dla licealistów',
    type: GridMenuType.image,
    imageAssetPath: Assets.images.image1.path,
    heartType: HeartType.full,
  ),
];
