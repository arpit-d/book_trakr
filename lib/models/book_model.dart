class BookModel {
  BookModel({
    required this.title,
    required this.authors,
    required this.type,
    required this.description,
    required this.covers,
    required this.subjectPlaces,
    required this.subjects,
  });
  late final String title;
  late final List<Authors> authors;
  late final Type type;
  late final String description;
  late final List<int> covers;
  late final List<String> subjectPlaces;
  late final List<String> subjects;

  BookModel.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    authors =
        List.from(json['authors']).map((e) => Authors.fromJson(e)).toList();

    description = json['description'];
    covers = List.castFrom<dynamic, int>(json['covers']);
    subjectPlaces = List.castFrom<dynamic, String>(json['subject_places']);
    subjects = List.castFrom<dynamic, String>(json['subjects']);
  }

  // Map<String, dynamic> toJson() {
  //   final data = <String, dynamic>{};
  //   data['title'] = title;
  //   data['authors'] = authors.map((e) => e.toJson()).toList();
  //   data['type'] = type.toJson();
  //   data['description'] = description;
  //   data['covers'] = covers;
  //   data['subject_places'] = subjectPlaces;
  //   data['subjects'] = subjects;
  //   data['latest_revision'] = latestRevision;

  //   return data;
  // }
}

class Authors {
  Authors({
    required this.author,
  });
  late final Author author;

  Authors.fromJson(Map<String, dynamic> json) {
    author = Author.fromJson(json['author']);
  }
}

class Author {
  Author({
    required this.key,
  });
  late final String key;

  Author.fromJson(Map<String, dynamic> json) {
    key = json['key'];
  }
}
