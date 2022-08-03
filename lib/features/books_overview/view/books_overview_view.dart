import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/book_overview_bloc.dart';

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
          return ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: state.books.length,
            itemBuilder: (context, index) {
              return Text(
                state.books[index].authors,
              );
            },
          );
        }
        return Container();
      },
    );
  }
}
