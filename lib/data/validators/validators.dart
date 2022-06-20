class Validators {
  static final RegExp _emailRegExp = RegExp(
    r'^[a-zA-Z0-9.!#$%&’*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$',
  );
  static final RegExp _passwordRegExp = RegExp(
    r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$',
  );

  static bool validateEmail(String value) =>
      _emailRegExp.hasMatch(value) && value.isNotEmpty;

  static bool validatePassword(String value) =>
      _passwordRegExp.hasMatch(value) && value.isNotEmpty;

  static bool validateConfirmedPassword(
          String passwordValue, String confirmedPasswordValue) =>
      passwordValue == confirmedPasswordValue;
}
