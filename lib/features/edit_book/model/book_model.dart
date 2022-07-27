// ignore_for_file: public_member_api_docs, sort_constructors_first
// To parse this JSON data, do
//
//     final bookModel = bookModelFromJson(jsonString);

import 'dart:convert';

import 'package:equatable/equatable.dart';

class BookModel extends Equatable {
  final String title;
  final String authors;
  final int pages;
  final String description;
  final String isbn;
  final String userReview;
  const BookModel({
    required this.title,
    required this.authors,
    required this.pages,
    required this.description,
    required this.isbn,
    required this.userReview,
  });

  BookModel copyWith({
    String? title,
    String? authors,
    int? pages,
    String? description,
    String? isbn,
    String? userReview,
  }) {
    return BookModel(
      title: title ?? this.title,
      authors: authors ?? this.authors,
      pages: pages ?? this.pages,
      description: description ?? this.description,
      isbn: isbn ?? this.isbn,
      userReview: userReview ?? this.userReview,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'authors': authors,
      'pages': pages,
      'description': description,
      'isbn': isbn,
      'userReview': userReview,
    };
  }

  factory BookModel.fromMap(Map<String, dynamic> map) {
    return BookModel(
      title: map['title'] as String,
      authors: map['authors'] as String,
      pages: map['pages'] as int,
      description: map['description'] as String,
      isbn: map['isbn'] as String,
      userReview: map['userReview'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory BookModel.fromJson(String source) =>
      BookModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props {
    return [
      title,
      authors,
      pages,
      description,
      isbn,
      userReview,
    ];
  }
}
