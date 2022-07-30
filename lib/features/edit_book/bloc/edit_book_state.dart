part of 'edit_book_bloc.dart';

// enum EditBookFormStatus {
//   invalid('Please add atleast book title & authors'),
//   initial(''),
//   valid('Added Book Succesfully!'),
//   loading('Adding Book');

//   const EditBookFormStatus(this.message);
//   final String message;
// }

class EditBookState extends Equatable {
  final String title;
  final String authors;
  final int pages;
  final String description;
  final String isbn;
  final String userReview;
//  final EditBookFormStatus editBookFormStatus;
  const EditBookState({
    required this.title,
    required this.authors,
    required this.pages,
    this.description = '',
    this.isbn = '',
    this.userReview = '',
//    this.editBookFormStatus = EditBookFormStatus.initial,
  });

  EditBookState copyWith({
    String? title,
    String? authors,
    int? pages,
    String? description,
    String? isbn,
    String? userReview,
    //  EditBookFormStatus? editBookFormStatus,
  }) {
    return EditBookState(
      title: title ?? this.title,
      authors: authors ?? this.authors,
      pages: pages ?? this.pages,
      description: description ?? this.description,
      isbn: isbn ?? this.isbn,
      userReview: userReview ?? this.userReview,
      //     editBookFormStatus: editBookFormStatus ?? this.editBookFormStatus
    );
  }

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
      //     editBookFormStatus
    ];
  }
}
