import 'package:bloc/bloc.dart';
import 'package:book_tracker/constants/enums.dart';
import 'package:book_tracker/data/exceptions/auth_exceptions/email_login_exceptions.dart';
import 'package:book_tracker/data/repository/auth_repository.dart';
import 'package:book_tracker/data/validators/validators.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../../../data/exceptions/auth_exceptions/google_login_exceptions.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this._authenticationRepository) : super(const LoginState());

  final AuthRepository _authenticationRepository;

  FormStatus formStatus() {
    debugPrint("${state.isEmailValid} && ${state.isPasswordValid}");
    return state.isEmailValid && state.isPasswordValid
        ? FormStatus.valid
        : FormStatus.invalid;
  }

  void emailChanged(String newEmailValue) {
    emit(
      state.copyWith(
        email: newEmailValue,
        isEmailValid: Validators.validateEmail(newEmailValue),
        status: formStatus(),
      ),
    );
  }

  void passwordChanged(String newPasswordValue) {
    emit(state.copyWith(
      password: newPasswordValue,
      isPasswordValid: Validators.validatePassword(newPasswordValue),
      status: formStatus(),
    ));
  }

  Future<void> login() async {
    emit(state.copyWith(status: FormStatus.submissionInProgress));
    try {
      await _authenticationRepository.signIn(
        email: state.email,
        password: state.password,
      );
      emit(state.copyWith(status: FormStatus.submissionSuccess));
    } on LoginWithEmailAndPasswordFailure catch (e) {
      emit(
        state.copyWith(
          errorMessage: e.message,
          status: FormStatus.submissionFailure,
        ),
      );
      emit(state.copyWith(status: FormStatus.initial));
    }
  }

  Future<void> logInWithGoogle() async {
    try {
      await _authenticationRepository.logInWithGoogle();
      emit(state.copyWith(status: FormStatus.submissionSuccess));
    } on LogInWithGoogleFailure catch (e) {
      emit(
        state.copyWith(
          errorMessage: e.message,
          status: FormStatus.submissionFailure,
        ),
      );
    } catch (_) {
      emit(state.copyWith(status: FormStatus.submissionFailure));
    }
  }
}