import 'package:login/app/features/login/infra/models/models.dart';

abstract class LoginDatasource {
  Future<LoginModel> auth(LoginParams params);
}
