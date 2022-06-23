import 'package:commons/shared/rest_client/rest_client_error_consts.dart';
import 'package:commons/shared/storage_token/storege_token_auth.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';

class AuthInterceptor extends Interceptor {
  StorageTokenAuth storageTokenAuth = StorageTokenAuth();

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    final storageTokenAuth = StorageTokenAuth();
    final apiToken = await storageTokenAuth.getTokenAuth();

    if (options.extra['auth_required'] == true) {
      options.headers.addAll({'authorization': 'Bearer $apiToken', 'content-type': 'aplication/json'});
    }
    handler.next(options);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    final code = err.response?.data['code'];
    if (code == RestClientErrors.expiredTokenError) {
      storageTokenAuth.deleteAllToken();
      debugPrint('Sessão expirada! Faça login novamente.');
    } else {
      handler.next(err);
    }
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    // super.onResponse(response, handler);
    handler.next(response);
  }
}
