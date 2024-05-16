import 'package:flutter_base_project_for_beginner/core/constants/api_path.dart';
import 'package:flutter_base_project_for_beginner/data/api_client.dart';
import 'package:flutter_base_project_for_beginner/data/models/param.dart';
import 'package:flutter_base_project_for_beginner/data/models/request_method.dart';
import 'package:flutter_base_project_for_beginner/data/services/auth_service.dart';
import 'package:flutter_base_project_for_beginner/utils/helpers/json_ext.dart';

import '../models/login_model.dart';

class AuthRepo {
  final ApiClient _apiClient = ApiClient();

  Future<bool> login(Params request) async {
    final res = await _apiClient.fetch(
      ApiPath.login,
      RequestMethod.post,
      rawData: request.toJson(),
    );

    if (res.hasError) throw res.error!.messages;

    final Map<String, dynamic> result = res.data.query('result');

    final model = LoginModel.fromMap(result);

    await AuthService.instance.saveToken(
      accessToken: model.accessToken,
      refreshToken: model.refreshToken,
      tokenExpiresTime: model.expiresIn,
    );

    return true;
  }

  Future<void> logout() {
    return AuthService.instance.invalid();
  }
}
