// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:commons/commons.dart';
import 'package:flutter/material.dart';
import 'package:login/app/features/login/domain/errors/errors.dart';
import 'package:login/app/features/login/infra/datasources/datasources.dart';
import 'package:login/app/features/login/infra/models/models.dart';

class LoginDatasourceImpl implements LoginDatasource {
  StorageTokenAuth storageTokenAuth = StorageTokenAuth();

  RestClient restClient;

  LoginDatasourceImpl({
    required this.restClient,
  });

  @override
  Future<LoginModel> auth(LoginParams params) async {
    //RestClientResponse? response = await restClient.post('/login', headers: params.toMap());

    // final _dio = Dio();

    // Response response = await _dio.post('https://5d3f54b8-cd8d-48f3-9a57-4613c022a8b5.mock.pstmn.io/login',
    //     options: Options(headers: params.toMap()));

    // log(response.data);
    // return LoginModel();

    RestClientResponse? response = await restClient.post('/login', headers: params.toMap());

    //Map<String, dynamic> respData = response.data;

    if (response.statusCode == 200) {
      if (response.data.isNotEmpty) {
        WidgetsFlutterBinding.ensureInitialized();
        //await storageTokenAuth.setTokenAuth(response.data['dataModel']['token']);
        return LoginModel.fromJson(response.data);
      }
    }

    throw DataSourceErrorLogin(
      message: response.data['message'],
      statusCode: response.data['statusCode'],
    );
  }
}
