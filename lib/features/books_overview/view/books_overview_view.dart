import 'package:book_tracker/core/utils/gaps.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/book_overview_bloc.dart';
import '../widgets/book_overview_card_widget.dart';

class BookOverviewView extends StatelessWidget {
  const BookOverviewView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BookOverviewBloc, BooksOverviewState>(
      builder: (context, state) {
        if (state is BooksOverviewLoading) {
          return const CircularProgressIndicator();
        }
        if (state is BooksOverviewLoaded) {
          if (state.books.isEmpty) {
            return const Text('No Books');
          }
          return ListView.separated(
            separatorBuilder: (context, index) => gapH12,
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: state.books.length,
            itemBuilder: (context, index) {
              final books = state.books[index];
              return BookOverviewCard(books: books);
            },
          );
        }
        return Container();
      },
    );
  }
}
