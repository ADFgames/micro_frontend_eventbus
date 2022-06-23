import 'package:login/app/features/login/domain/entities/entities.dart';

class LoginEntity {
  int? code;
  String? message;
  DataEntity? dataEntity;

  LoginEntity({this.code, this.message, this.dataEntity});
}
