import 'package:bloc/bloc.dart';
import 'package:book_tracker/constants/enums.dart';
import 'package:book_tracker/data/exceptions/auth_exceptions/email_signup_exceptions.dart';
import 'package:book_tracker/data/repository/auth_repository.dart';
import 'package:book_tracker/data/validators/validators.dart';
import 'package:equatable/equatable.dart';

part 'signup_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit(this._authenticationRepository) : super(const SignUpState());

  final AuthRepository _authenticationRepository;

  void emailChanged(String newEmailValue) {
    emit(state.copyWith(
      email: newEmailValue,
      isEmailValid: Validators.validateEmail(newEmailValue),
    ));
  }

  void passwordChanged(String newPasswordValue) {
    emit(state.copyWith(
      password: newPasswordValue,
      isPasswordValid: Validators.validatePassword(newPasswordValue),
    ));
  }

  void confirmedPasswordChanged(String newConfirmedPasswordValue) {
    emit(
      state.copyWith(
        confirmedPassword: newConfirmedPasswordValue,
        isConfirmedPasswordValid: Validators.validateConfirmedPassword(
          state.password,
          newConfirmedPasswordValue,
        ),
      ),
    );
  }

  Future<void> signUpFormSubmitted() async {
    if (!state.isFormValid) return;
    try {
      emit(state.copyWith(status: FormStatus.submissionInProgress));
      await _authenticationRepository.signUp(
        email: state.email,
        password: state.password,
      );
      emit(state.copyWith(status: FormStatus.submissionSuccess));
    } on SignUpWithEmailAndPasswordFailure catch (e) {
      emit(
        state.copyWith(
          errorMessage: e.message,
          status: FormStatus.submissionFailure,
        ),
      );
      emit(state.copyWith(status: FormStatus.initial));
    } catch (e) {
      emit(
        state.copyWith(
          errorMessage: e.toString(),
          status: FormStatus.submissionFailure,
        ),
      );
      emit(state.copyWith(status: FormStatus.initial));
    }
  }
}
