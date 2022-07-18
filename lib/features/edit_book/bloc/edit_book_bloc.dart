import 'package:bloc/bloc.dart';
import 'package:book_tracker/features/edit_book/model/book_model.dart';
import 'package:book_tracker/features/edit_book/repository/book_repository.dart';
import 'package:equatable/equatable.dart';

part 'edit_book_event.dart';
part 'edit_book_state.dart';

class EditBookBloc extends Bloc<EditBookEvent, EditBookState> {
  final BookRepository _bookRepository;

  EditBookBloc({required BookRepository bookRepository})
      : _bookRepository = bookRepository,
        super(const EditBookState(title: '', authors: '')) {
    on<EditBookTitleChanged>(_onTitleChanged);
    on<EditBookAuthorsChanged>(_onBookAuthorsChanged);
    on<EditBookSubmitted>(_onBookSubmitted);
  }
  void _onTitleChanged(
      EditBookTitleChanged event, Emitter<EditBookState> emit) {
    emit(state.copyWith(title: event.title));
  }

  void _onBookAuthorsChanged(
      EditBookAuthorsChanged event, Emitter<EditBookState> emit) {
    emit(state.copyWith(authors: event.authors));
  }

  Future<void> _onBookSubmitted(
      EditBookSubmitted event, Emitter<EditBookState> emit) async {
    try {
      _bookRepository
          .addBook(BookModel(title: state.title, authors: state.authors));
    } catch (e) {}
  }
}
