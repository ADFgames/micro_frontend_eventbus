// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class LoginModel {
  final int? code;
  final String? message;
  final DataModel? dataModel;

  LoginModel({
    this.code,
    this.message,
    this.dataModel,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'code': code,
      'message': message,
      'dataModel': dataModel?.toMap(),
    };
  }

  factory LoginModel.fromMap(Map<String, dynamic> map) {
    return LoginModel(
      code: map['code'] as int,
      message: map['message'] as String,
      dataModel: DataModel.fromMap(map['dataModel'] as Map<String, dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory LoginModel.fromJson(String source) => LoginModel.fromMap(json.decode(source) as Map<String, dynamic>);

  LoginModel copyWith({
    int? code,
    String? message,
    DataModel? dataModel,
  }) {
    return LoginModel(
      code: code ?? this.code,
      message: message ?? this.message,
      dataModel: dataModel ?? this.dataModel,
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

class DataModel {
  final String token;
  final List<String> links;

  DataModel({
    required this.token,
    required this.links,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'token': token,
      'links': links,
    };
  }

  factory DataModel.fromMap(Map<String, dynamic> map) {
    return DataModel(
        token: map['token'] as String,
        links: List<String>.from(
          (map['links']),
        ));
  }

  String toJson() => json.encode(toMap());

  factory DataModel.fromJson(String source) => DataModel.fromMap(json.decode(source) as Map<String, dynamic>);
}

// class DataModel {
//   String? token;
//   List<String>? links;

//   DataModel({token, links});

//   DataModel.fromJson(Map<String, dynamic> json) {
//     token = json['token'];
//     links = json['links'].cast<String>();
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['token'] = token;
//     data['links'] = links;
//     return data;
//   }
// }
