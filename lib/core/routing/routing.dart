import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pro_multimedia/core/routing/routes_name.dart';
import 'package:pro_multimedia/core/routing/routing_transition.dart';
import 'package:pro_multimedia/features/dashboard/view/dashboard_screen.dart';
import 'package:pro_multimedia/features/dashboard/view/second_screen.dart';

final rootNavigatorKey = GlobalKey<NavigatorState>();

final GoRouter router = GoRouter(
  navigatorKey: rootNavigatorKey,
  debugLogDiagnostics: true,
  initialLocation: RouteName.mainScreen,
  routes: [
    GoRoute(
      path: '/mainScreen',
      name: RouteName.mainScreen,
      pageBuilder: (context, state) => RoutingTransition.fadeTransition(
        DashboardScreen(),
      ),
    ),
    GoRoute(
      path: '/secondScreen',
      name: RouteName.secondScreen,
      pageBuilder: (context, state) => RoutingTransition.fadeTransition(
        const SecondScreen(),
      ),
    ),
  ],
);
