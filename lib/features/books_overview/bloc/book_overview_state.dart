part of 'book_overview_bloc.dart';

abstract class BooksOverviewState extends Equatable {
  const BooksOverviewState();

  @override
  List<Object> get props => [];
}

class BooksOverviewLoading extends BooksOverviewState {}

class BooksOverviewLoaded extends BooksOverviewState {
  final List<BookModel> books;

  const BooksOverviewLoaded({required this.books});
  @override
  List<Object> get props => [books];
}
