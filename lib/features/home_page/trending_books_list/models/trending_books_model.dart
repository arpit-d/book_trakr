class TrendingBooksList {
  TrendingBooksList({
    required this.query,
    required this.works,
  });

  final String query;
  final List<Work> works;

  factory TrendingBooksList.fromJson(Map<String, dynamic> json) {
    List workList = json["works"];
    List<Work> works = [];
    // We only want to display the first 5 trending books
    // since the Open Library Api doesn't return the entire 100 books
    // it is supposed to which leave the app in a limbo
    // since it keeps waiting for data which never arrives
    // Also shuffle the Books we receive, so the user sees new books
    // instead of the same ones every time
    for (int i = 0; i < 10; i++) {
      Work work = Work.fromJson(workList[i]);
      works.add(work);
      works.shuffle();
    }

    return TrendingBooksList(
      query: json["query"],
      works: works.sublist(0, 5),
    );
  }
}

class Work {
  Work({
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

  factory Work.fromJson(Map<String, dynamic> json) => Work(
        key: json["key"],
        title: json["title"] as String,
        editionCount: json["edition_count"],
        firstPublishYear: json["first_publish_year"],
        coverEditionKey: json["cover_edition_key"],
        coverI: json["cover_i"],
      );
}
