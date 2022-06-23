// import 'package:dependencies/dependencies.dart';
import 'package:login/app/core/inject/inject.dart';
import 'package:login/app/features/login/presenter/login_page.dart';
import 'package:micro_core/app/micro_app.dart';
import 'package:micro_core/app/micro_core_utils.dart';

class MicroAppLoginResolver implements MicroApp {
  @override
  void Function() get injectionsRegister => InjectLogin.initialize;

  @override
  String get microAppName => "micro_app_login";

  @override
  Map<String, WidgetBuilderArgs> get routes => {
        "/login": (context, args) => const LoginPage(),
      };

  @override
  void Function() get createListener => () {};
}
