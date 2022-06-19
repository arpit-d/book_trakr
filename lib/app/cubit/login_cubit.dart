import 'package:bloc/bloc.dart';
import 'package:book_tracker/constants/enums.dart';
import 'package:book_tracker/data/exceptions/auth_exceptions/email_login_exceptions.dart';
import 'package:book_tracker/data/repository/auth_repository.dart';
import 'package:book_tracker/data/validators/validators.dart';
import 'package:equatable/equatable.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this._authenticationRepository) : super(const LoginState());

  final AuthRepository _authenticationRepository;
  final RegExp _emailRegExp = RegExp(
    r'^[a-zA-Z0-9.!#$%&’*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$',
  );
  final RegExp _passwordRegExp = RegExp(
    r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$',
  );
  void emailChanged(String newEmailValue) {
    emit(state.copyWith(
      email: newEmailValue,
      password: state.password,
      isEmailValid: _isEmailValid(newEmailValue),
      isPasswordValid: state.isPasswordValid,
    ));
  }

  void passwordChanged(String newPasswordValue) {
    emit(state.copyWith(
      email: state.email,
      password: newPasswordValue,
      isEmailValid: state.isEmailValid,
      isPasswordValid: _isPasswordValid(newPasswordValue),
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
    } catch (_) {
      emit(state.copyWith(status: FormStatus.submissionFailure));
      emit(state.copyWith(status: FormStatus.initial));
    }
  }

  bool _isEmailValid(String email) {
    return _emailRegExp.hasMatch(email);
  }

  bool _isPasswordValid(String password) {
    return _passwordRegExp.hasMatch(password);
  }
}
