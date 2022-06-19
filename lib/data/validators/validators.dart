class Validators {
  static validateEmail(String? value) {
    if (value!.isEmpty) {
      return 'Please enter some text';
    }
    if (!value.contains("@")) {
      return 'Invalid Email';
    }
    return null;
  }
}
