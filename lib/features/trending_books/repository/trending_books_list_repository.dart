import '../../../../data/provider/open_library_api_client.dart';
import '../models/trending_books_model.dart';

class TrendingBooksListRepository {
  TrendingBooksListRepository({OpenLibraryApiClient? openLibraryApiClient})
      : _openLibraryApiClient = openLibraryApiClient ?? OpenLibraryApiClient();

  final OpenLibraryApiClient _openLibraryApiClient;

  Future<TrendingBooksModel> getTrendingBooks() async {
    final trendingBooksList = await _openLibraryApiClient.getTrendingBooks();
    return TrendingBooksModel(
        query: trendingBooksList.query, works: trendingBooksList.works);
  }
}
