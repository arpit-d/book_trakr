import 'package:flutter/rendering.dart';

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
    for (int i = 0; i <= 4; i++) {
      Work work = Work.fromJson(workList[i]);
      works.add(work);
      debugPrint(work.title.toString());
    }

    return TrendingBooksList(
      query: json["query"],
      works: works,
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
