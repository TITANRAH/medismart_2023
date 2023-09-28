// To parse this JSON data, do
//
//     final userResponse = userResponseFromJson(jsonString);

import 'dart:convert';
import 'package:medismart_2023/domain/infrastructure/models/user/user_data_response.dart';

UserResponse userResponseFromJson(String str) => UserResponse.fromJson(json.decode(str));

String userResponseToJson(UserResponse data) => json.encode(data.toJson());

class UserResponse {
    final String token;
    final UserData userData;

    UserResponse({
        required this.token,
        required this.userData,
    });

    factory UserResponse.fromJson(Map<String, dynamic> json) => UserResponse(
        token: json["token"],
        userData: UserData.fromJson(json["userData"]),
    );

    Map<String, dynamic> toJson() => {
        "token": token,
        "userData": userData.toJson(),
    };
}

