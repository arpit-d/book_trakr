part of 'signup_cubit.dart';

class SignUpState extends Equatable {
  const SignUpState({
    this.email = '',
    this.password = '',
    this.confirmedPassword = '',
    this.status = FormStatus.initial,
    this.errorMessage,
  });

  final String email;
  final String password;
  final String confirmedPassword;
  final FormStatus status;
  final String? errorMessage;

  @override
  List<Object> get props => [email, password, confirmedPassword, status];

  SignUpState copyWith({
    String? email,
    String? password,
    String? confirmedPassword,
    FormStatus? status,
    String? errorMessage,
  }) {
    return SignUpState(
      email: email ?? this.email,
      password: password ?? this.password,
      confirmedPassword: confirmedPassword ?? this.confirmedPassword,
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
