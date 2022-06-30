part of 'trending_books_cubit.dart';

abstract class TrendingBooksState extends Equatable {
  const TrendingBooksState();

  @override
  List<Object> get props => [];
}

class TrendingBooksInitial extends TrendingBooksState {}

class TrendingBooksLoading extends TrendingBooksState {}

class TrendingBooksLoaded extends TrendingBooksState {}

class TrendingBooksError extends TrendingBooksState {}
