// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:login/login.dart';
import 'package:mobx/mobx.dart';

part 'home_page_controller.g.dart';

class HomePageController = HomePageControllerBase with _$HomePageController;

abstract class HomePageControllerBase with Store {
  // String updateEventBus() {
  //   var result = EventBus.listen;
  //   return result;
  // }
  final LoginModel loginModel;

  HomePageControllerBase(this.loginModel);
}
