import 'dart:developer';

import 'package:commons/commons.dart';
import 'package:dependencies/dependencies.dart';

class DioRestClient implements RestClient {
  late Dio _dio;

  final BaseOptions _defaultBaseOptions = BaseOptions(
    baseUrl: const String.fromEnvironment("API_BASE_URL", defaultValue: apiDevBaseUrl),
    connectTimeout: 3000,
    receiveTimeout: 3000,
  );

  DioRestClient({BaseOptions? options}) {
    _dio = Dio(options ?? _defaultBaseOptions);
    _dio.interceptors.addAll([
      LogInterceptor(),
      AuthInterceptor(),
    ]);
  }

  @override
  RestClient auth() {
    _defaultBaseOptions.extra['auth_required'] = true;
    return this;
  }

  @override
  RestClient unauth() {
    _defaultBaseOptions.extra['auth_required'] = false;
    return this;
  }

  @override
  Future<RestClientResponse<T>> delete<T>(
    String path, {
    data,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
  }) async {
    try {
      final response = await _dio.delete(
        path,
        data: data,
        queryParameters: queryParameters,
        options: Options(
          headers: headers,
        ),
      );
      return _dioResponseConverter<T>(response);
    } on DioError catch (e) {
      throw RestClientException(
        error: e.response?.statusMessage,
        statusCode: e.response?.statusCode,
        message: e.response?.statusMessage,
        response: _dioErrorResponseConverter(e.response),
      );
    }
  }

  @override
  Future<RestClientResponse<T>> get<T>(
    String path, {
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
  }) async {
    try {
      final response = await _dio.get(
        path,
        queryParameters: queryParameters,
        options: Options(
          headers: headers,
        ),
      );
      return _dioResponseConverter<T>(response);
    } on DioError catch (e) {
      throw RestClientException(
        error: e.response?.statusMessage,
        statusCode: e.response?.statusCode,
        message: e.response?.statusMessage,
        response: _dioErrorResponseConverter(e.response),
      );
    }
  }

  @override
  Future<RestClientResponse<T>> patch<T>(
    String path, {
    data,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
  }) async {
    try {
      final response = await _dio.patch(
        path,
        data: data,
        queryParameters: queryParameters,
        options: Options(
          headers: headers,
        ),
      );
      return _dioResponseConverter<T>(response);
    } on DioError catch (e) {
      throw RestClientException(
        error: e.response?.statusMessage,
        statusCode: e.response?.statusCode,
        message: e.response?.statusMessage,
        response: _dioErrorResponseConverter(e.response),
      );
    }
  }

  @override
  Future<RestClientResponse<T>> post<T>(
    String path, {
    data,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
  }) async {
    try {
      final response = await _dio.post(
        path,
        data: data,
        queryParameters: queryParameters,
        options: Options(
          headers: headers,
        ),
      );
      log(response.data.toString());
      return _dioResponseConverter<T>(response);
    } on DioError catch (e) {
      throw RestClientException(
        error: e.response?.statusMessage,
        statusCode: e.response?.statusCode,
        message: e.response?.statusMessage,
        response: _dioErrorResponseConverter(e.response),
      );
    }
  }

  @override
  Future<RestClientResponse<T>> put<T>(
    String path, {
    data,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
  }) async {
    try {
      final response = await _dio.put(
        path,
        data: data,
        queryParameters: queryParameters,
        options: Options(
          headers: headers,
        ),
      );
      return _dioResponseConverter<T>(response);
    } on DioError catch (e) {
      throw RestClientException(
        error: e.response?.statusMessage,
        statusCode: e.response?.statusCode,
        message: e.response?.statusMessage,
        response: _dioErrorResponseConverter(e.response),
      );
    }
  }

  @override
  Future<RestClientResponse<T>> request<T>(
    String path, {
    data,
    required String method,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
  }) async {
    try {
      final response = await _dio.request(
        path,
        data: data,
        queryParameters: queryParameters,
        options: Options(
          headers: headers,
          method: method,
        ),
      );
      return _dioResponseConverter<T>(response);
    } on DioError catch (e) {
      throw RestClientException(
        error: e.response?.statusMessage,
        statusCode: e.response?.statusCode,
        message: e.response?.statusMessage,
        response: _dioErrorResponseConverter(e.response),
      );
    }
  }

  RestClientResponse? _dioErrorResponseConverter(Response? response) {
    return RestClientResponse(
      data: response?.data,
      statusCode: response?.statusCode,
      statusMessage: response?.statusMessage,
    );
  }

  RestClientResponse<T> _dioResponseConverter<T>(Response response) {
    return RestClientResponse<T>(
      data: response.data,
      statusCode: response.statusCode,
      statusMessage: response.statusMessage,
    );
  }
}
