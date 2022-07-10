part of 'signup_cubit.dart';

class SignUpState extends Equatable {
  const SignUpState({
    this.email = '',
    this.password = '',
    this.confirmedPassword = '',
    this.status = FormStatus.initial,
    this.errorMessage,
    this.isEmailValid = false,
    this.isPasswordValid = false,
    this.isConfirmedPasswordValid = false,
  });

  final String email;
  final String password;
  final String confirmedPassword;
  final FormStatus status;
  final String? errorMessage;
  final bool isEmailValid;
  final bool isPasswordValid;
  final bool isConfirmedPasswordValid;

  bool get isFormValid =>
      isEmailValid && (isPasswordValid && isConfirmedPasswordValid);

  @override
  List<Object> get props => [
        email,
        password,
        confirmedPassword,
        status,
        isEmailValid,
        isPasswordValid,
        isConfirmedPasswordValid
      ];

  SignUpState copyWith({
    String? email,
    String? password,
    String? confirmedPassword,
    FormStatus? status,
    String? errorMessage,
    bool? isEmailValid,
    bool? isPasswordValid,
    bool? isConfirmedPasswordValid,
  }) {
    return SignUpState(
      email: email ?? this.email,
      password: password ?? this.password,
      confirmedPassword: confirmedPassword ?? this.confirmedPassword,
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
      isEmailValid: isEmailValid ?? this.isEmailValid,
      isPasswordValid: isPasswordValid ?? this.isPasswordValid,
      isConfirmedPasswordValid:
          isConfirmedPasswordValid ?? this.isConfirmedPasswordValid,
    );
  }
}
