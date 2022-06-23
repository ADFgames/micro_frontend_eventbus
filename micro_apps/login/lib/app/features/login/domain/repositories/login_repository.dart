import 'package:commons/commons.dart';
import 'package:dartz/dartz.dart';
import 'package:login/app/features/login/infra/models/models.dart';

abstract class LoginRepository {
  Future<Either<Failure, LoginModel>> auth(LoginParams params);
}
