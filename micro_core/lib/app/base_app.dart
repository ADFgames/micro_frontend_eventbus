import 'package:flutter/material.dart';
import 'package:micro_core/micro_core.dart';

abstract class BaseApp {
  List<MicroApp> get microApps;

  Map<String, WidgetBuilderArgs> get baseRoutes;

  final Map<String, WidgetBuilderArgs> routes = {};

  void registerRouters() {
    if (baseRoutes.isNotEmpty) routes.addAll(baseRoutes);
    if (microApps.isNotEmpty) {
      for (MicroApp microApp in microApps) {
        routes.addAll(microApp.routes);
      }
    }
  }

  void registerInjections() {
    if (microApps.isNotEmpty) {
      for (MicroApp microApp in microApps) {
        microApp.injectionsRegister();
      }
    }
  }

  void registerListeners() {
    if (microApps.isNotEmpty) {
      for (MicroApp microApp in microApps) {
        microApp.createListener();
      }
    }
  }

  Route<dynamic>? generateRoute(RouteSettings settings) {
    var routeName = settings.name;
    var routeArgs = settings.arguments;

    var navigateTo = routes[routeName];
    if (navigateTo == null) return null;

    return MaterialPageRoute(
      builder: (context) => navigateTo.call(context, routeArgs),
    );
  }
}
