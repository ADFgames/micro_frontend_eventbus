// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:eventbus/eventbus.dart';
import 'package:login/app/features/login/domain/usecases/usecases.dart';
import 'package:login/app/features/login/infra/models/models.dart';
import 'package:micro_core/app/micro_core_utils.dart';
import 'package:mobx/mobx.dart';

part 'login_controller.g.dart';

class LoginController = LoginControllerBase with _$LoginController;

abstract class LoginControllerBase with Store {
  final LoginUsecase usecaseImpl;

  LoginControllerBase({
    required this.usecaseImpl,
  });

  @observable
  String email = "";

  @action
  void upadateEmail(String newValue) => email = newValue;

  @observable
  String password = "";

  @action
  void updatePassword(String newValue) => password = newValue;

  @observable
  bool obscuredText = false;

  @action
  void updateObscuredText(bool newValue) => obscuredText = newValue;

  @observable
  ErrorLoginModel errorLoginModel = ErrorLoginModel(message: '', statusCode: 0);
  @action
  void setLoginInfoState(ErrorLoginModel newValue) => errorLoginModel = newValue;

  Future<void> auth(String email, String password) async {
    LoginParams params = LoginParams(email: email, password: password);

    final result = await usecaseImpl.auth(params);

    result.fold((loginFailure) {
      errorLoginModel.message = loginFailure.message;
      setLoginInfoState(errorLoginModel);
    }, (loginModel) {
      EventBus.emit(loginModel.toJson());
      navigatorKey.currentState?.pushReplacementNamed('/home');
    });
  }
}
