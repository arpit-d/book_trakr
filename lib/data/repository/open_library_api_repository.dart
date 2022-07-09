
/// {@template open_library_api_response_class}
/// Repository which manages calls to the "openlibrary.org"
/// {@endtemplate}
// class OpenLibraryApiResponse {
//   /// {@template open_library_trending_books_list_api_response}
//   /// Gets the daily trending list of books from OpenLibrary
//   /// {@endtemplate}
//   Future<void> getTrendingBooksList() async {
//     try {
//       // Await the HTTP GET response, then decode the
//       // JSON data it contains.
//       final response = await http
//           .get(Uri.parse('https://openlibrary.org/trending/daily.json'));
//       if (response.statusCode == 200) {
//         trendingBooksListFromJson(response.body.toString());
//       } else {
//         debugPrint('Request failed with status: ${response.statusCode}.');
//       }
//     } catch (_) {}
//   }
// }
