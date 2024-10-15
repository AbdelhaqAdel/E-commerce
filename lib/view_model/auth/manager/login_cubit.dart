import 'package:salla/model/auth/auth_data/register_model.dart';
import 'package:salla/model/auth/auth_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../model/auth/auth_data/login_model.dart';
part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this._authRepository) : super(LoginInitialState());
    final AuthRepository _authRepository;

  static LoginCubit get(context)=> BlocProvider.of(context);
  IconData suffix=Icons.visibility_outlined;

  bool passVisibility=true;

 void login({
    required String email,
    required String password,
})async{
    emit(LoginLoadingState());
   try {
      final loginModel = await _authRepository.login(email: email, password: password);
      emit(LoginSuccessState(loginModel!));
    } catch (error) {
      emit(LoginErrorState(error.toString()));
    }
  }



  void register({
    required String email,
    required String password,
    required String name,
    required String phone,
  }) async{
    emit(RegisterLoadingState());
    try {
      final  registerModel = await _authRepository.register(
        email: email,
        password: password,
        name: name,
        phone: phone,
      );
      emit(RegisterSuccessState(registerModel));
    } catch (error) {
      emit(RegisterErrorState(error.toString()));
    }
  }

void changePasswordVisibility(){
  passVisibility=!passVisibility;
    suffix=passVisibility?Icons.visibility_off_outlined:Icons.visibility_outlined;
  emit(ChangePassVisibilityState());
}

}
