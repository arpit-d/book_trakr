import 'package:book_tracker/data/provider/firebase_db_client.dart';
import 'dart:async';

import '../model/book_model.dart';

class BookRepository {
  final FirebaseDbClient _firebaseDbClient;

  BookRepository({FirebaseDbClient? firebaseDbClient})
      : _firebaseDbClient = firebaseDbClient ?? FirebaseDbClient();

  Future<void> addBook(BookModel book) => _firebaseDbClient.addBook(book);
}
