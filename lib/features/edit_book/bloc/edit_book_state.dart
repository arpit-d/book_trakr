part of 'edit_book_bloc.dart';

class EditBookState extends Equatable {
  final String title;
  final String authors;

  const EditBookState({
    required this.title,
    required this.authors,
  });
  @override
  List<Object?> get props => [title, authors];

  EditBookState copyWith({
    String? title,
    String? authors,
  }) {
    return EditBookState(
      title: title ?? this.title,
      authors: authors ?? this.authors,
    );
  }
}
