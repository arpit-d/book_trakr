import 'package:book_tracker/data/network/open_library_api_client.dart';
import 'package:book_tracker/view/home_page/trending_books_list/models/trending_books_model.dart';

class TrendingBooksListRepository {
  TrendingBooksListRepository({OpenLibraryApiClient? openLibraryApiClient})
      : _openLibraryApiClient = openLibraryApiClient ?? OpenLibraryApiClient();

  final OpenLibraryApiClient _openLibraryApiClient;

  Future<TrendingBooksList> getTrendingBooks() async {
    final trendingBooksList = await _openLibraryApiClient.getTrendingBooks();
    return TrendingBooksList(
        query: trendingBooksList.query, works: trendingBooksList.works);
  }
}
