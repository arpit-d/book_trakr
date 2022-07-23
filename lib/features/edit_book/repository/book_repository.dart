import 'dart:async';

import '../../../data/provider/firebase_db_client.dart';
import '../../../models/user_model.dart';
import '../model/book_model.dart';

class BookRepository {
  final FirebaseDbClient _firebaseDbClient;
  final UserModel userModel;

  BookRepository({FirebaseDbClient? firebaseDbClient, required this.userModel})
      : _firebaseDbClient = firebaseDbClient ?? FirebaseDbClient(userModel);

  Future<void> addBook(BookModel book) => _firebaseDbClient.addBook(book);
}
