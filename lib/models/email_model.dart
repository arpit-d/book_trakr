enum EmailValidationError {
  /// Generic invalid error.
  invalid
}

class EmailValue {
  final String email;

  EmailValue._({required this.email});

  static final RegExp _emailRegExp = RegExp(
    r'^[a-zA-Z0-9.!#$%&’*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$',
  );
}
