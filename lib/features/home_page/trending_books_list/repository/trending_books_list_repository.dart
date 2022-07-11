import 'package:book_tracker/features/home_page/trending_books_list/models/trending_books_model.dart';

import '../../../../data/provider/open_library_api_client.dart';

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
