import 'dart:convert';

import 'package:flutter_web_app/app/modules/shared/model/response_model.dart';

class SucessModel implements ResponseModel {
  int code;
  String message;
  SucessModel({
    required this.code,
    required this.message,
  });

  Map<String, dynamic> toMap() {
    return {
      'code': code,
      'message': message,
    };
  }

  factory SucessModel.fromMap(Map<String, dynamic> map) {
    return SucessModel(
      code: map['code']?.toInt() ?? 0,
      message: map['message'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory SucessModel.fromJson(String source) =>
      SucessModel.fromMap(json.decode(source));
}
