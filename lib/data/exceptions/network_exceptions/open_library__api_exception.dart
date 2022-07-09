class OpenLibraryApiException implements Exception {
  final String message;

  const OpenLibraryApiException([this.message = "Request failed!"]);
  factory OpenLibraryApiException.fromResponseStatusCode(int statusCode) {
    return OpenLibraryApiException(
      "Request failed with status code: $statusCode}",
    );
  }
}
