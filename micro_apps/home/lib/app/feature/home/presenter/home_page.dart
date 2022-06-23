import 'package:dependencies/dependencies.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:home/app/feature/home/presenter/controller/home_page_controller.dart';
import 'package:login/app/features/login/infra/models/login_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final HomePageController controller;
  late final LoginModel model;

  @override
  void initState() {
    super.initState();
    controller = GetIt.I.get<HomePageController>();
    model = GetIt.I.get<LoginModel>();
    print(model.code.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: SPcolors.greyColor.shade50,
      appBar: AppBar(title: const Text('Home Page')),
      body: Center(
        child: Text(controller.loginModel.code.toString()),
      ),
    );
  }
}
