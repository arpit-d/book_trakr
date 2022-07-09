import 'package:bloc/bloc.dart';
import 'package:book_tracker/view/home_page/trending_books_list/models/trending_books_model.dart';
import 'package:book_tracker/view/home_page/trending_books_list/repository/trending_books_list_repository.dart';

import 'package:equatable/equatable.dart';

part 'trending_books_state.dart';

class TrendingBooksCubit extends Cubit<TrendingBooksState> {
  TrendingBooksCubit(this._trendingBooksListRepository)
      : super(TrendingBooksInitial()) {
    getTrendingBooksList();
  }
  final TrendingBooksListRepository _trendingBooksListRepository;

  Future<void> getTrendingBooksList() async {
    emit(TrendingBooksLoading());

    try {
      // final trendingBooksList =
      //     await _trendingBooksListRepository.getTrendingBooks();
      emit(TrendingBooksLoaded(
          trendingBooksList:
              await _trendingBooksListRepository.getTrendingBooks()));
      //  debugPrint(trendingBooksList.works.length.toString());
    } catch (_) {}
  }
}
