import 'package:book_tracker/features/edit_book/model/book_model.dart';

import '../../../data/provider/firebase_db_client.dart';
import '../../app/models/app_user_model.dart';

class BookOverviewRepository {
  final FirebaseDbClient _firebaseDbClient;
  final UserModel userModel;

  BookOverviewRepository(
      {FirebaseDbClient? firebaseDbClient, required this.userModel})
      : _firebaseDbClient = firebaseDbClient ?? FirebaseDbClient(userModel);
  Stream<List<BookModel>> getBooks() {
    return _firebaseDbClient.getBook();
  }
}
