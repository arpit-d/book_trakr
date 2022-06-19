class LoginWithEmailAndPasswordFailure {
  final String message;

  const LoginWithEmailAndPasswordFailure(
      [this.message = "An authentication error has occured."]);

  factory LoginWithEmailAndPasswordFailure.fromErrorCode(String errorCode) {
    switch (errorCode) {
      case 'invalid-email':
        return const LoginWithEmailAndPasswordFailure(
          'Email is not valid or badly formatted.',
        );
      case 'user-disabled':
        return const LoginWithEmailAndPasswordFailure(
          'This user has been disabled. Please contact support for help.',
        );
      case 'user-not-found':
        return const LoginWithEmailAndPasswordFailure(
          'This email is not registered.',
        );
      case 'email-already-in-use':
        return const LoginWithEmailAndPasswordFailure(
          'An account already exists for that email.',
        );
      case 'operation-not-allowed':
        return const LoginWithEmailAndPasswordFailure(
          'Operation is not allowed.  Please contact support.',
        );
      case 'weak-password':
        return const LoginWithEmailAndPasswordFailure(
          'Please enter a stronger password.',
        );
      default:
        return const LoginWithEmailAndPasswordFailure();
    }
  }
}
