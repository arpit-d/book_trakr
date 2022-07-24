part of 'trending_books_cubit.dart';

abstract class TrendingBooksState extends Equatable {
  const TrendingBooksState();

  @override
  List<Object> get props => [];
}

class TrendingBooksInitial extends TrendingBooksState {}

class TrendingBooksLoading extends TrendingBooksState {}

class TrendingBooksLoaded extends TrendingBooksState {
  final TrendingBooksModel trendingBooksList;

  const TrendingBooksLoaded({required this.trendingBooksList});
  @override
  List<Object> get props => [trendingBooksList];
}

class TrendingBooksError extends TrendingBooksState {}
