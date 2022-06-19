import 'package:bloc/bloc.dart';
import 'package:book_tracker/constants/enums.dart';
import 'package:book_tracker/data/exceptions/auth_exceptions/email_signup_exceptions.dart';
import 'package:book_tracker/data/repository/auth_repository.dart';
import 'package:equatable/equatable.dart';

part 'signup_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit(this._authenticationRepository) : super(const SignUpState());

  final AuthRepository _authenticationRepository;

  void emailChanged(String newEmailValue) {
    emit(state.copyWith(
        email: newEmailValue,
        password: state.password,
        confirmedPassword: state.confirmedPassword));
  }

  void passwordChanged(String newPasswordValue) {
    emit(state.copyWith(
        email: state.email,
        password: newPasswordValue,
        confirmedPassword: state.confirmedPassword));
  }

  void confirmedPasswordChanged(String newCOnfirmedPasswordValue) {
    emit(state.copyWith(
        email: state.email,
        password: state.password,
        confirmedPassword: newCOnfirmedPasswordValue));
  }

  Future<void> signUpFormSubmitted() async {
    if (state.confirmedPassword == state.password) {
      emit(state.copyWith(status: FormStatus.submissionInProgress));

      try {
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
      } catch (_) {
        emit(state.copyWith(status: FormStatus.submissionFailure));
      }
    }
  }
}
