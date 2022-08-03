import 'package:cloud_firestore/cloud_firestore.dart';

import '../../features/app/models/app_user_model.dart';
import '../../features/edit_book/model/book_model.dart';

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

  Stream<List<BookModel>> getBook() {
    return _firebaseDatabase
        .collection("UserData")
        .doc(user.uid)
        .collection('BooksList')
        .snapshots()
        .map((event) {
      return event.docs.map((e) => BookModel.fromMap(e.data())).toList();
    });
  }
}
