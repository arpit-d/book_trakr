import 'package:book_tracker/app/core/gaps.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/trending_books_cubit.dart';
import '../repository/trending_books_list_repository.dart';

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
          return const Center(child: CircularProgressIndicator());
        }
        if (state is TrendingBooksLoaded) {
          final trendingBooksList = state.trendingBooksList.works;
          return Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: trendingBooksList.length,
              itemBuilder: ((context, index) {
                return Padding(
                  padding: const EdgeInsets.only(right: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(5.0),
                        child: Image.network(
                          'https://covers.openlibrary.org/b/id/${trendingBooksList[index].coverI}-L.jpg',
                          fit: BoxFit.fill,
                          height: 180,
                          width: 140,
                        ),
                      ),
                      gapH4,
                      SizedBox(
                        width: 140,
                        child: Text(
                          trendingBooksList[index].title,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                );
              }),
            ),
          );
        }
        return Container();
      },
    );
  }
}
