import 'dart:convert';

import 'package:flutter_web_app/app/modules/shared/model/response_model.dart';

class ErrorModel implements ResponseModel {
  int code;
  String message;
  String details;
  ErrorModel({
    required this.code,
    required this.message,
    required this.details,
  });

  Map<String, dynamic> toMap() {
    return {'code': code, 'message': message, 'details': details};
  }

  factory ErrorModel.fromMap(Map<String, dynamic> map) {
    return ErrorModel(
        code: map['code']?.toInt() ?? 0,
        message: map['message'] ?? '',
        details: map['details'] ?? '');
  }

  String toJson() => json.encode(toMap());

  factory ErrorModel.fromJson(String source) =>
      ErrorModel.fromMap(json.decode(source));
}
