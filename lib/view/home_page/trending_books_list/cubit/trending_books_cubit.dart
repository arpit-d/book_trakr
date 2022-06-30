import 'package:bloc/bloc.dart';
import 'package:book_tracker/view/home_page/trending_books_list/repository/trending_book_repository.dart';
import 'package:equatable/equatable.dart';

part 'trending_books_state.dart';

class TrendingBooksCubit extends Cubit<TrendingBooksState> {
  TrendingBooksCubit({required this.trendingBooksListRepository})
      : super(TrendingBooksInitial()) {
    getTrendingBooksList();
  }
  final TrendingBooksListRepository trendingBooksListRepository;

  void getTrendingBooksList() async {}
}
