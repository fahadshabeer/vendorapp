part of 'login_cubit.dart';


abstract class LoginState {}

class LoginInitial extends LoginState {}
class LoginLoading extends LoginState {}
class LoginLoaded extends LoginState {}
class LoginError extends LoginState {
  String err;
  LoginError({required this.err});
}
