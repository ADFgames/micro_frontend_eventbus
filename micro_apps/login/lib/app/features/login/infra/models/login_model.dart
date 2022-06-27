// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class LoginModel {
  final int? code;
  final String? message;
  final Map<String, dynamic>? dataModel;

  LoginModel({
    this.code,
    this.message,
    this.dataModel,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'code': code,
      'message': message,
      'dataModel': dataModel,
    };
  }

  factory LoginModel.fromMap(Map<String, dynamic> map) {
    return LoginModel(
      code: map['code'] as int,
      message: map['message'] as String,
      dataModel: map['dataModel'],
    );
  }

  String toJson() => json.encode(toMap());

  factory LoginModel.fromJson(String source) => LoginModel.fromMap(json.decode(source) as Map<String, dynamic>);

  LoginModel copyWith({
    int? code,
    String? message,
    Map<String, dynamic>? dataModel,
  }) {
    return LoginModel(
      code: code ?? this.code,
      message: message ?? this.message,
      dataModel: dataModel ?? {},
    );
  }

  @override
  String toString() => 'LoginModel(code: $code, message: $message, dataModel: $dataModel)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is LoginModel && other.code == code && other.message == message && other.dataModel == dataModel;
  }

  @override
  int get hashCode => code.hashCode ^ message.hashCode ^ dataModel.hashCode;
}
