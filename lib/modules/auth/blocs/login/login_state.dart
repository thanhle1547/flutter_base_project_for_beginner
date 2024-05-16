part of 'login_cubit.dart';

abstract class LoginState extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoginInitial extends LoginState {}

// LOGIN

class LoginLoading extends LoginState {}

class UserBlockedState extends LoginState {}

class LoginFailed extends LoginState {
  LoginFailed({
    required this.message,
  });

  final String message;

  @override
  List<Object?> get props => [message];
}

class LoginSuccess extends LoginState {
  LoginSuccess({
    required this.isSuccess,
  });

  final bool isSuccess;

  @override
  List<Object?> get props => [isSuccess];
}
