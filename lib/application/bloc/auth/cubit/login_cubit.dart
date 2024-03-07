import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:novindus_machine_test/application/repositories/auth_repository.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  AuthRepository authRepository = AuthRepository();
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  LoginCubit() : super(LoginInitial());

  Future userLogin() async {
    emit(LoginLoading());
    final dataResponse = await authRepository.userLogin(
        username: usernameController.text, password: passwordController.text);
    if (dataResponse) {
      emit(LoginSuccess());
    } else {
      emit(LoginFailure());
    }
  }
}
