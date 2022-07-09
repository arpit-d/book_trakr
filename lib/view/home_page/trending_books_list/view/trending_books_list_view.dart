import 'package:book_tracker/app/core/gaps.dart';
import 'package:book_tracker/view/home_page/trending_books_list/cubit/trending_books_cubit.dart';
import 'package:book_tracker/view/home_page/trending_books_list/repository/trending_books_list_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TrendingBooksList extends StatelessWidget {
  const TrendingBooksList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TrendingBooksCubit(TrendingBooksListRepository()),
      child: const TrendingBooksListView(),
    );
  }
}

class TrendingBooksListView extends StatelessWidget {
  const TrendingBooksListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TrendingBooksCubit, TrendingBooksState>(
      buildWhen: (previous, current) => previous != current,
      builder: (context, state) {
        if (state is TrendingBooksLoading) {
          return const CircularProgressIndicator();
        }
        if (state is TrendingBooksLoaded) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Trending Books",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              gapH8,
              Text(state.trendingBooksList.works.last.title),
            ],
          );
        }
        return Container();
      },
    );
  }
}
