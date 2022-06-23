import 'package:commons/commons.dart';

import 'package:dependencies/dependencies.dart';
import 'package:login/app/features/login/domain/repositories/login_repository.dart';
import 'package:login/app/features/login/domain/usecases/usecases.dart';
import 'package:login/app/features/login/external/datasources/datasources.dart';
import 'package:login/app/features/login/infra/datasources/login_datasource.dart';
import 'package:login/app/features/login/infra/repositories/login_repository_impl.dart';
import 'package:login/app/features/login/presenter/controller/login_controller.dart';

class InjectLogin {
  static initialize() {
    GetIt getIt = GetIt.instance;
    // Core
    getIt.registerLazySingleton<RestClient>(() => DioRestClient());

    //restclient
    //getIt.registerLazySingleton<RestClient>(() => getIt<RestClient>());

    // datasource
    getIt.registerLazySingleton<LoginDatasource>(() => LoginDatasourceImpl(restClient: getIt()));

    // repositories
    getIt.registerLazySingleton<LoginRepository>(() => LoginRepositoryImpl(datasource: getIt()));

    //usecases
    getIt.registerLazySingleton<LoginUsecase>(() => LoginUsecaseImpl(repository: getIt()));

    // controller
    getIt.registerLazySingleton<LoginController>(() => LoginController(usecaseImpl: getIt()));
  }
}
