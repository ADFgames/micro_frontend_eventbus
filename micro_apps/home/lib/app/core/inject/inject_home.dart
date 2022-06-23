import 'package:dependencies/dependencies.dart';
import 'package:home/app/feature/home/presenter/controller/home_page_controller.dart';
import 'package:login/app/features/login/infra/models/models.dart';

class InjectHome {
  static initialize() {
    GetIt getIt = GetIt.instance;

    getIt.registerLazySingleton<LoginModel>(() => LoginModel(code: 333));

    getIt.registerLazySingleton<HomePageController>(() => HomePageController(getIt<LoginModel>()));

    //getIt.registerLazySingleton(() => HomePageController());
  }
}
