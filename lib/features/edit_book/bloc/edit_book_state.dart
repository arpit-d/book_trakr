part of 'edit_book_bloc.dart';

class EditBookState extends Equatable {
  final String title;
  final String authors;
  final int pages;
  final String description;
  final String isbn;
  final String userReview;
  const EditBookState({
    required this.title,
    required this.authors,
    required this.pages,
    this.description = '',
    this.isbn = '',
    this.userReview = '',
  });

  EditBookState copyWith({
    String? title,
    String? authors,
    int? pages,
    String? description,
    String? isbn,
    String? userReview,
  }) {
    return EditBookState(
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

  factory EditBookState.fromMap(Map<String, dynamic> map) {
    return EditBookState(
      title: map['title'] as String,
      authors: map['authors'] as String,
      pages: map['pages'] as int,
      description: map['subtitle'] as String,
      isbn: map['isbn'] as String,
      userReview: map['userReview'] as String,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object> get props {
    return [title, authors, pages, description, isbn, userReview];
  }
}
