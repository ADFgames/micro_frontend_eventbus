import 'package:eventbus/eventbus.dart';
import 'package:home/app/core/inject/inject_home.dart';
import 'package:home/app/feature/home/presenter/home_page.dart';
import 'package:login/app/features/login/infra/models/models.dart';
import 'package:micro_core/app/micro_app.dart';
import 'package:micro_core/app/micro_core_utils.dart';
//import 'package:dependencies/dependencies.dart';

class MicroAppHomeResolver implements MicroApp {
  @override
  void Function() get createListener => () {
        EventBus.listen((event) {
          var model = LoginModel(
            code: event['code'],
            message: 'Sucesso!!!!!',
            dataModel: event['dataModel'],
          );

          print(model.code.toString());

          //       message: loginModel.message,
          //       dataModel: loginModel.dataModel,
          // GetIt getIt = GetIt.instance;

          // getIt.registerLazySingleton<LoginModel>(() => LoginModel(
          //       code: loginModel.code,
          //       message: loginModel.message,
          //       dataModel: loginModel.dataModel,
          //     ));

          // HomePageController(loginModel);
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
