import 'package:book_tracker/data/exceptions/auth_exceptions/email_login_exceptions.dart';
import 'package:book_tracker/data/exceptions/auth_exceptions/email_signup_exceptions.dart';
import 'package:book_tracker/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;

class AuthRepository {
  final _firebaseAuth = firebase_auth.FirebaseAuth.instance;

  Future<void> signUp({required String email, required String password}) async {
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
    } on firebase_auth.FirebaseAuthException catch (e) {
      throw SignUpWithEmailAndPasswordFailure.fromErrorCode(e.code);
    } catch (_) {
      throw const SignUpWithEmailAndPasswordFailure();
    }
  }

  Future<void> signIn({
    required String email,
    required String password,
  }) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
    } on firebase_auth.FirebaseAuthException catch (e) {
      throw LoginWithEmailAndPasswordFailure.fromErrorCode(e.code);
    } catch (_) {
      throw const LoginWithEmailAndPasswordFailure();
    }
  }

  Future<void> signOut() async {
    try {
      await _firebaseAuth.signOut();
    } catch (e) {
      throw Exception(e);
    }
  }

  Stream<UserModel> get user {
    return _firebaseAuth.authStateChanges().map((firebaseUser) {
      final UserModel user =
          firebaseUser == null ? UserModel.empty : firebaseUser.toUser;
      return user;
    });
  }

  UserModel get currentUser {
    return _firebaseAuth.currentUser == null
        ? UserModel.empty
        : _firebaseAuth.currentUser!.toUser;
  }
}

extension on firebase_auth.User {
  UserModel get toUser {
    return UserModel(
        uid: uid, email: email, name: displayName, photo: photoURL);
  }
}
