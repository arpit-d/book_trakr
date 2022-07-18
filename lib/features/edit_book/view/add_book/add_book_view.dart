import 'package:book_tracker/features/edit_book/bloc/edit_book_bloc.dart';
import 'package:book_tracker/features/edit_book/repository/book_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'add_book_form.dart';

class AddBookView extends StatelessWidget {
  const AddBookView({Key? key}) : super(key: key);
  static Page page() => const MaterialPage<void>(child: AddBookView());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add New Book'),
      ),
      body: BlocProvider(
        create: (_) => EditBookBloc(bookRepository: BookRepository()),
        child: const Padding(
          padding: EdgeInsets.all(12.0),
          child: AddBookForm(),
        ),
      ),
    );
  }
}
