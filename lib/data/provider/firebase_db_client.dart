import 'package:book_tracker/features/edit_book/model/book_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../../features/edit_book/model/book_model.dart';
import '../../models/user_model.dart';

/// {@template authentication_repository}
/// Data provider class which manages Firebase Firestore functions
/// {@endtemplate}
class FirebaseDbClient {
  final UserModel user;
  final FirebaseFirestore _firebaseDatabase = FirebaseFirestore.instance;

  FirebaseDbClient(this.user);

  Future<void> addBook(BookModel book) => _firebaseDatabase
      .collection("UserData")
      .doc(user.uid)
      .collection('BooksList')
      .add(book.toMap());
}
