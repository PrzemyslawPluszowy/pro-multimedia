import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pro_multimedia/core/constants_variable.dart';
import 'package:pro_multimedia/core/providers.dart';
import 'package:pro_multimedia/core/routing/routing.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: GlobalProviders.getBlocProviders(),
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: ConstantsVariable.appName,
        routerConfig: router,
        theme: ThemeData(
          appBarTheme: AppBarTheme(
            backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          ),
          useMaterial3: true,
        ),
      ),
    );
  }
}
