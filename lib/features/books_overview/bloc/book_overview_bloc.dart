import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../edit_book/model/book_model.dart';
import '../repository/books_overview_repository.dart';

part 'book_overview_event.dart';
part 'book_overview_state.dart';

class BookOverviewBloc extends Bloc<BookOverviewEvent, BooksOverviewState> {
  StreamSubscription? _booksSubscription;
  final BookOverviewRepository _bookOverviewRepository;

  BookOverviewBloc({required BookOverviewRepository bookOverviewRepository})
      : _bookOverviewRepository = bookOverviewRepository,
        super(BooksOverviewLoading()) {
    on<LoadBooks>(_onLoadBooks);

    _booksSubscription = _bookOverviewRepository
        .getBooks()
        .listen((books) => add(LoadBooks(books)));
  }

  void _onLoadBooks(
    LoadBooks event,
    Emitter<BooksOverviewState> emit,
  ) {
    emit(BooksOverviewLoaded(books: event.books));
  }

  @override
  Future<void> close() async {
    _booksSubscription?.cancel();
    super.close();
  }
}
