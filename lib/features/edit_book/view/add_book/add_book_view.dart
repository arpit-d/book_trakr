import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/edit_book_bloc.dart';
import '../../repository/book_repository.dart';
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
        create: (_) =>
            EditBookBloc(bookRepository: context.read<BookRepository>()),
        child: const AddBookForm(),
      ),
    );
  }
}
