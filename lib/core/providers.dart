import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pro_multimedia/features/dashboard/view/cubit/grid_menu_cubit.dart';

/// GlobalProviders
/// Tutaj umieszczamy wszystkie globalne providery Bloc/Cubit,
/// które mają być dostępne w całej aplikacji.

class GlobalProviders {
  static List<BlocProvider<dynamic>> getBlocProviders() {
    return [
      BlocProvider<GridMenuCubit>(
        create: (context) => GridMenuCubit(),
      ),
    ];
  }
}
