import 'package:dependencies/dependencies.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:login/app/features/login/infra/models/login_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late LoginModel model;
  @override
  void initState() {
    super.initState();
    model = GetIt.I.get<LoginModel>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: SPcolors.greyColor.shade50,
      appBar: AppBar(title: const Text('Home Page')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('CODE: ' + model.code.toString()),
              Text('MESSAGE: ' + model.message.toString()),
              Text('LINKs: ' + model.dataModel!['links'][0]),
              Text('LINKs: ' + model.dataModel!['links'][1]),
              Text('TOKEN: ' + model.dataModel!['token']),
            ],
          ),
        ),
      ),
    );
  }
}
