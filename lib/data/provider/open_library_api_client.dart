import 'dart:async';
import 'dart:convert';

import 'package:book_tracker/data/exceptions/network_exceptions/open_library__api_exception.dart';
import 'package:book_tracker/features/home_page/trending_books_list/models/trending_books_model.dart';
import 'package:http/http.dart' as http;

class OpenLibraryApiClient {
  OpenLibraryApiClient({http.Client? httpClient})
      : _httpClient = httpClient ?? http.Client();

  static const _baseUrl = 'https://openlibrary.org';
  final http.Client _httpClient;
  Future<TrendingBooksList> getTrendingBooks() async {
    // Await the HTTP GET response, then decode the
    // JSON data it contains.
    final response =
        await _httpClient.get(Uri.parse('$_baseUrl/trending/daily.json'));
    if (response.statusCode != 200) {
      throw OpenLibraryApiException.fromResponseStatusCode(response.statusCode);
    }
    return TrendingBooksList.fromJson((json.decode(response.body.toString())));
  }
}
