//The class name was changed from TrendingBooksList to TrendingBooksModel to accurately depict what the class actually represents, i.e., a single object of the list it gets from [trending/daily.json] API response

class TrendingBooksModel {
  TrendingBooksModel({
    required this.query,
    required this.works,
  });

  final String query;
  final List<WorkModel> works;

  factory TrendingBooksModel.fromJson(Map<String, dynamic> json) {
    List workList = json["works"];
    List<WorkModel> works = [];
    // We only want to display the first 5 trending books
    // since the Open Library Api doesn't return the entire 100 books
    // it is supposed to which leave the app in a limbo
    // since it keeps waiting for data which never arrives
    // Also shuffle the Books we receive, so the user sees new books
    // instead of the same ones every time
    for (int i = 0; i < 10; i++) {
      WorkModel work = WorkModel.fromJson(workList[i]);
      works.add(work);
      works.shuffle();
    }

    return TrendingBooksModel(
      query: json["query"],
      works: works.sublist(0, 5),
    );
  }
}

class WorkModel {
  WorkModel({
    required this.key,
    required this.title,
    required this.editionCount,
    required this.firstPublishYear,
    required this.coverEditionKey,
    required this.coverI,
  });

  final String key;
  final String title;
  final int editionCount;
  final int firstPublishYear;
  final String coverEditionKey;
  final int coverI;

  factory WorkModel.fromJson(Map<String, dynamic> json) => WorkModel(
        key: json["key"],
        title: json["title"] as String,
        editionCount: json["edition_count"],
        firstPublishYear: json["first_publish_year"],
        coverEditionKey: json["cover_edition_key"],
        coverI: json["cover_i"],
      );
}
