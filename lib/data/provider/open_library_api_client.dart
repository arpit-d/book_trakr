import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../features/trending_books/models/trending_books_model.dart';
import '../exceptions/network_exceptions/open_library_api_exception.dart';

class OpenLibraryApiClient {
  OpenLibraryApiClient({http.Client? httpClient})
      : _httpClient = httpClient ?? http.Client();

  static const _baseUrl = 'https://openlibrary.org';
  final http.Client _httpClient;
  Future<TrendingBooksModel> getTrendingBooks() async {
    // Await the HTTP GET response, then decode the
    // JSON data it contains.
    final response =
        await _httpClient.get(Uri.parse('$_baseUrl/trending/daily.json'));
    if (response.statusCode != 200) {
      throw OpenLibraryApiException.fromResponseStatusCode(response.statusCode);
    }
    return TrendingBooksModel.fromJson((json.decode(response.body.toString())));
  }
}
