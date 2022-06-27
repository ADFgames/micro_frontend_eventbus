import 'dart:convert';
import 'dart:developer';

import 'package:dependencies/dependencies.dart';
import 'package:eventbus/eventbus.dart';
import 'package:home/app/core/inject/inject_home.dart';
import 'package:home/app/feature/home/presenter/home_page.dart';
import 'package:login/app/features/login/infra/models/models.dart';
import 'package:micro_core/app/micro_app.dart';
import 'package:micro_core/app/micro_core_utils.dart';

class MicroAppHomeResolver implements MicroApp {
  LoginModel? model;
  GetIt getIt = GetIt.instance;
  @override
  void Function() get createListener => () {
        EventBus.listen((event) {
          var merda = jsonDecode(event);

          model = LoginModel(
            code: merda['code'],
            message: merda['message'],
            dataModel: merda['dataModel'],
          );
          log('Resolver antes Register LoginModel!!!!!!!! ============================');
          getIt.registerLazySingleton<LoginModel>(() => model!);
        });
      };

  @override
  void Function() get injectionsRegister => InjectHome.initialize;

  @override
  String get microAppName => 'micro_app_home';

  @override
  Map<String, WidgetBuilderArgs> get routes => {
        "/home": (context, args) => const HomePage(),
      };
}
