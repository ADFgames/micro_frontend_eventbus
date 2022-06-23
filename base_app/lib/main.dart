import 'package:flutter/material.dart';
import 'package:home/home.dart';
import 'package:login/app/features/login/presenter/login_page.dart';
import 'package:login/app/micro_app_login_resolver.dart';
import 'package:micro_core/app/base_app.dart';
import 'package:micro_core/app/micro_core_utils.dart';
import 'package:micro_core/app/micro_app.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget with BaseApp {
  MyApp({Key? key}) : super(key: key) {
    super.registerInjections();
    super.registerRouters();
    super.registerListeners();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Micro Frontend',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      navigatorKey: navigatorKey,
      onGenerateRoute: super.generateRoute,
      initialRoute: "/login",
      home: const LoginPage(),
    );
  }

  @override
  Map<String, WidgetBuilderArgs> get baseRoutes => {};

  @override
  List<MicroApp> get microApps => [
        MicroAppLoginResolver(),
        MicroAppHomeResolver(),
      ];
}
