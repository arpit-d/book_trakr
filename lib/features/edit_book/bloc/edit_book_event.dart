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

class EditBookPagesChanged extends EditBookEvent {
  final String pages;

  const EditBookPagesChanged(this.pages);

  @override
  List<Object> get props => [pages];
}

class EditBookDescriptionChanged extends EditBookEvent {
  final String description;

  const EditBookDescriptionChanged(this.description);

  @override
  List<Object> get props => [description];
}

class EditBookIsbnChanged extends EditBookEvent {
  final String isbn;

  const EditBookIsbnChanged(this.isbn);

  @override
  List<Object> get props => [isbn];
}

class EditBookUserReviewChanged extends EditBookEvent {
  final String userReview;

  const EditBookUserReviewChanged(this.userReview);

  @override
  List<Object> get props => [userReview];
}

class EditBookSubmit extends EditBookEvent {
  const EditBookSubmit();
}
