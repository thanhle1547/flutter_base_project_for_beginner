import 'package:equatable/equatable.dart';
import 'package:flutter_base_project_for_beginner/core/error_handling/app_error_state.dart';
import 'package:flutter_base_project_for_beginner/core/error_handling/exceptions.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../repo/auth_repo.dart';
import '../../repo/login_param.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit({
    required AuthRepo repo,
  })  : _repo = repo,
        super(LoginInitial());

  final AuthRepo _repo;

  Future<void> login({
    String? email,
    String? password,
  }) async {
    try {
      emit(LoginLoading());
      final isSuccess = await _repo.login(
        LoginParam(email: email, password: password),
      );

      emit(LoginSuccess(isSuccess: isSuccess));
    } on RequestedResourceLockedException catch (_) {
      // Nếu tk bị khoá thì chỉ emit LoginFailed
      // Màn Dashboard sẽ xử lý chung thực hiện dialog thông báo
      _repo.logout();
      emit(UserBlockedState());
    } catch (e) {
      emit(LoginFailed(message: AppErrorState.getFriendlyErrorString(e)));
    }
  }
}
