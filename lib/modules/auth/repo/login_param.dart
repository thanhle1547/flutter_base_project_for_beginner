
import 'package:flutter_base_project_for_beginner/data/models/param.dart';

class LoginParam extends Params {
  const LoginParam({
    this.email,
    this.password,
  });

  final String? email;
  final String? password;

  @override
  Map<String, dynamic>? toJson() {
    return <String, dynamic>{
      if (email != null) "email": email!,
      if (password != null) "password": password!,
    };
  }
}
