import 'package:book_tracker/features/edit_book/model/book_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../../features/edit_book/model/book_model.dart';

class FirebaseDbClient {
  final FirebaseFirestore _firebaseDatabase = FirebaseFirestore.instance;

  Future<void> addBook(BookModel book) =>
      _firebaseDatabase.collection('BooksList').add(book.toMap());
}
