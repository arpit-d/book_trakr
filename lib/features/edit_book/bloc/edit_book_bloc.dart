import 'package:book_tracker/features/edit_book/model/book_model.dart';
import 'package:book_tracker/features/edit_book/repository/book_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
    on<EditBookSubmit>(_onBookSubmitted);
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
    final pages = int.tryParse(event.pages) ?? 0;
    emit(state.copyWith(pages: pages));
  }

  void _onBookDescriptionChanged(
      EditBookDescriptionChanged event, Emitter<EditBookState> emit) {
    emit(state.copyWith(description: event.description));
  }

  void _onBookIsbnChanged(
      EditBookIsbnChanged event, Emitter<EditBookState> emit) {
    emit(state.copyWith(isbn: event.isbn));
  }

  void _onBookUserReviewChanged(
      EditBookUserReviewChanged event, Emitter<EditBookState> emit) {
    emit(state.copyWith(userReview: event.userReview));
  }

  void _onBookSubmitted(EditBookSubmit event, Emitter<EditBookState> emit) {
    final book = BookModel(
      title: state.title,
      authors: state.authors,
      pages: state.pages,
      description: state.description,
      isbn: state.isbn,
      userReview: state.userReview,
    );
    debugPrint(book.toString());

    try {
      _bookRepository.addBook(book);
    } finally {}
  }
}
