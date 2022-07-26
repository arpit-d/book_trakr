import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../repository/book_repository.dart';

part 'edit_book_event.dart';
part 'edit_book_state.dart';

class EditBookBloc extends Bloc<EditBookEvent, EditBookState> {
  final BookRepository _bookRepository;

  EditBookBloc({required BookRepository bookRepository})
      : _bookRepository = bookRepository,
        super(const EditBookState(title: '', authors: '', pages: 0)) {
    on<EditBookTitleChanged>(_onTitleChanged);
    on<EditBookAuthorsChanged>(_onAuthorsChanged);
    on<EditBookPagesChanged>(_onPagesChanged);
    on<EditBookDescriptionChanged>(_onBookDescriptionChanged);
    on<EditBookIsbnChanged>(_onBookIsbnChanged);
    on<EditBookUserReviewChanged>(_onBookUserReviewChanged);
  }
  void _onTitleChanged(
      EditBookTitleChanged event, Emitter<EditBookState> emit) {
    emit(state.copyWith(title: event.title));
  }

  void _onAuthorsChanged(
      EditBookAuthorsChanged event, Emitter<EditBookState> emit) {
    emit(state.copyWith(authors: event.authors));
  }

  void _onPagesChanged(
      EditBookPagesChanged event, Emitter<EditBookState> emit) {
    emit(state.copyWith(authors: event.pages));
  }

  void _onBookDescriptionChanged(
      EditBookDescriptionChanged event, Emitter<EditBookState> emit) {
    emit(state.copyWith(authors: event.description));
  }

  void _onBookIsbnChanged(
      EditBookIsbnChanged event, Emitter<EditBookState> emit) {
    emit(state.copyWith(authors: event.isbn));
  }

  void _onBookUserReviewChanged(
      EditBookUserReviewChanged event, Emitter<EditBookState> emit) {
    emit(state.copyWith(authors: event.userReview));
  }
}
