// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:commons/shared/errors/errors.dart';

abstract class ErrorsLogin extends Failure {
  @override
  String? get message;
  int? get statusCode;
}

class InvalidDataErrorLogin implements ErrorsLogin {
  @override
  String? message;

  @override
  int? statusCode;

  InvalidDataErrorLogin({
    this.message,
    this.statusCode,
  });
}

class DataSourceErrorLogin implements ErrorsLogin {
  @override
  String? message;

  @override
  int? statusCode;

  DataSourceErrorLogin({
    this.message,
    this.statusCode,
  });
}

class BadRequest implements ErrorsLogin {
  @override
  String? message;

  @override
  int? statusCode;

  BadRequest({
    this.message,
    this.statusCode,
  });
}
