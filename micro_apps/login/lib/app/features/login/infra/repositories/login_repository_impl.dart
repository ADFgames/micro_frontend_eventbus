// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:commons/shared/errors/errors.dart';
import 'package:commons/shared/rest_client/rest_client_error_consts.dart';
import 'package:commons/shared/rest_client/rest_client_exception.dart';
import 'package:dartz/dartz.dart';
import 'package:login/app/features/login/domain/errors/errors_login.dart';
import 'package:login/app/features/login/domain/repositories/login_repository.dart';
import 'package:login/app/features/login/infra/datasources/datasources.dart';
import 'package:login/app/features/login/infra/models/models.dart';

class LoginRepositoryImpl implements LoginRepository {
  final LoginDatasource datasource;

  LoginRepositoryImpl({
    required this.datasource,
  });

  @override
  Future<Either<Failure, LoginModel>> auth(LoginParams params) async {
    try {
      final result = await datasource.auth(params);
      return Right(result);
    } on RestClientException catch (e) {
      final code = e.response?.data['code'];
      final message = e.response?.data['message'];

      if (code == RestClientErrors.internalServerError) return Left(InternalServerError(message: message));
      if (code == RestClientErrors.unauthorizedError) return Left(UnauthorizedError(message: message));
      if (code == 400) return Left(BadRequest(message: message));
      if (code == 1) return Left(InvalidDataErrorLogin(message: message));

      rethrow;
    }
  }
}
