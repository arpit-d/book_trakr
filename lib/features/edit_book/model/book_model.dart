// ignore_for_file: public_member_api_docs, sort_constructors_first
// To parse this JSON data, do
//
//     final bookModel = bookModelFromJson(jsonString);

import 'dart:convert';

import 'package:equatable/equatable.dart';

class BookModel extends Equatable {
  final String? id;
  final String title;
  final String authors;
  final String? key;

  const BookModel({
    this.id,
    required this.title,
    required this.authors,
    this.key,
  });

  // factory BookModel.fromJson(Map<String, dynamic> json) => BookModel(
  //       title: json["title"],
  //       authors: json["authors"],
  //       key: json["key"],
  //     );

  // Map<String, dynamic> toJson() => {
  //       "title": title,
  //       "authors": authors,
  //       "key": key,
  //     };

  BookModel copyWith({
    String? id,
    String? title,
    String? authors,
    String? key,
  }) {
    return BookModel(
      id: id ?? this.id,
      title: title ?? this.title,
      authors: authors ?? this.authors,
      key: key ?? this.key,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'authors': authors,
      'key': key,
    };
  }

  factory BookModel.fromMap(Map<String, dynamic> map) {
    return BookModel(
      id: map['id'] as String,
      title: map['title'] as String,
      authors: map['authors'] as String,
      key: map['key'] != null ? map['key'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory BookModel.fromJson(String source) =>
      BookModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [title, authors];
}
