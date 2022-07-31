import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/edit_book_bloc.dart';
import '../../repository/book_repository.dart';
import 'edit_book_form.dart';

class EditBookView extends StatelessWidget {
  const EditBookView({Key? key}) : super(key: key);
  static Route<void> route() {
    return MaterialPageRoute(builder: (_) => const EditBookView());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add New Book'),
      ),
      body: BlocProvider(
        create: (_) =>
            EditBookBloc(bookRepository: context.read<BookRepository>()),
        child: const EditBookForm(),
      ),
    );
  }
}
