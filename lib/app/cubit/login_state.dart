part of 'login_cubit.dart';

class LoginState extends Equatable {
  const LoginState({
    this.email = '',
    this.password = '',
    this.status = FormStatus.initial,
    this.errorMessage,
    this.isEmailValid = false,
    this.isPasswordValid = false,
  });
  final String email;
  final String password;
  final bool isEmailValid;
  final bool isPasswordValid;
  final FormStatus status;
  final String? errorMessage;

  @override
  List<Object> get props =>
      [email, password, status, isEmailValid, isPasswordValid];

  LoginState copyWith({
    String? email,
    String? password,
    FormStatus? status,
    String? errorMessage,
    bool? isEmailValid,
    bool? isPasswordValid,
  }) {
    return LoginState(
      email: email ?? this.email,
      password: password ?? this.password,
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
      isEmailValid: isEmailValid ?? this.isEmailValid,
      isPasswordValid: isPasswordValid ?? this.isPasswordValid,
    );
  }
}
