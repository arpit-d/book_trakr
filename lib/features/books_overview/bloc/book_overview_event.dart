part of 'book_overview_bloc.dart';

abstract class BookOverviewEvent extends Equatable {
  const BookOverviewEvent();

  @override
  List<Object> get props => [];
}

class LoadBooks extends BookOverviewEvent {
  final List<BookModel> books;

  const LoadBooks(this.books);

  @override
  List<Object> get props => [books];
}
