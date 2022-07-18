part of 'edit_book_bloc.dart';

abstract class EditBookEvent extends Equatable {
  const EditBookEvent();

  @override
  List<Object> get props => [];
}

class EditBookTitleChanged extends EditBookEvent {
  final String title;

  const EditBookTitleChanged(this.title);

  @override
  List<Object> get props => [title];
}

class EditBookAuthorsChanged extends EditBookEvent {
  final String authors;

  const EditBookAuthorsChanged(this.authors);

  @override
  List<Object> get props => [authors];
}

class EditBookSubmitted extends EditBookEvent {
  const EditBookSubmitted();
  @override
  List<Object> get props => [];
}
