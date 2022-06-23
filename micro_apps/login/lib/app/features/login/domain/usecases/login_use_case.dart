// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:commons/commons.dart';
import 'package:dartz/dartz.dart';
import 'package:login/app/features/login/domain/errors/errors.dart';
import 'package:login/app/features/login/domain/repositories/login_repository.dart';
import 'package:login/app/features/login/infra/models/models.dart';

abstract class LoginUsecase {
  Future<Either<Failure, LoginModel>> auth(LoginParams params);
}

class LoginUsecaseImpl implements LoginUsecase {
  final LoginRepository repository;

  LoginUsecaseImpl({
    required this.repository,
  });

  @override
  Future<Either<Failure, LoginModel>> auth(LoginParams params) async {
    if (params.email.isEmpty || params.password.isEmpty) {
      return Left(
        InvalidDataErrorLogin(
          message: 'Parâmetros de autenticação inválidos!',
          statusCode: 0,
        ),
      );
    }
    return await repository.auth(params);
  }
}
