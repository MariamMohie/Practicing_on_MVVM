import 'dart:convert';

UserError userErrorFromJson(String ?str) => UserError.fromJson(json.decode(str!));

String userErrorToJson(UserError data) => json.encode(data.toJson());

class UserError {
  UserError({
    this.code,
    this.message,
  });

  int ?code;
  Object? message;

  factory UserError.fromJson(Map<String, dynamic> json) => UserError(
        code: json["code"] == null ? null : json["code"],
        message: json["message"] == null ? null : json["message"],
      );

  Map<String, dynamic> toJson() => {
        "code": code == null ? null : code,
        "message": message == null ? null : message,
      };
}