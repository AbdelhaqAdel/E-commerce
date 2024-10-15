part of 'login_cubit.dart';

abstract class LoginState {}

class LoginInitialState extends LoginState {}

class LoginLoadingState extends LoginState {}

class LoginSuccessState extends LoginState {
   final LoginModel loginModel;
  LoginSuccessState(this.loginModel);
}

class LoginErrorState extends LoginState {
   String? error;
   LoginErrorState(this.error);
}
class ChangePassVisibilityState extends LoginState {}


class RegisterLoadingState extends LoginState{}

class RegisterSuccessState extends LoginState{
  final RegisterModel? registerModel;
  RegisterSuccessState(this.registerModel);
}

class RegisterErrorState extends LoginState{
  String? error;
  RegisterErrorState(this.error);
}