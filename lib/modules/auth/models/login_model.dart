import 'package:flutter_base_project_for_beginner/utils/helpers/json_ext.dart';

class LoginModel {
  final String accessToken;
  final String refreshToken;
  final int? expiresIn;

  LoginModel({
    required this.accessToken,
    required this.refreshToken,
    this.expiresIn,
  });

  factory LoginModel.fromMap(Map<String, dynamic> map) {
    return LoginModel(
      accessToken: map.lookup('access_token'),
      refreshToken: map.lookup('refresh_token'),
      expiresIn: map.lookup('expires_in'),
    );
  }
}
