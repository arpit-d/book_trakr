import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/utils.dart';
import '../../../../core/widgets/widgets.dart';
import '../../bloc/edit_book_bloc.dart';

class AddBookForm extends StatelessWidget {
  const AddBookForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<EditBookBloc, EditBookState>(
      listener: (context, state) {},
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: const [
              _BookTitleInput(),
              gapH4,
              _AuthorInput(),
              gapH4,
              _PagesInput(),
              gapH4,
              _DescriptionInput(),
              gapH4,
              _IsbnInput(),
              gapH4,
              _UserReview(),
              gapH16,
              _SubmitBookButton(),
            ],
          ),
        ),
      ),
    );
  }
}

class _SubmitBookButton extends StatelessWidget {
  const _SubmitBookButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SquareButton(
      title: 'Add Book',
      onPressed: () {
        context.read<EditBookBloc>().add(const EditBookSubmit());
      },
      isDisabled: false,
    );
  }
}

class _UserReview extends StatelessWidget {
  const _UserReview({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EditBookBloc, EditBookState>(
      buildWhen: (previous, current) =>
          previous.userReview != current.userReview,
      builder: (context, state) {
        return TextFormField(
          keyboardType: TextInputType.text,
          textCapitalization: TextCapitalization.words,
          decoration: const InputDecoration(
            labelText: 'User Review',
          ),
          onChanged: (val) =>
              context.read<EditBookBloc>().add(EditBookUserReviewChanged(val)),
        );
      },
    );
  }
}

class _IsbnInput extends StatelessWidget {
  const _IsbnInput({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EditBookBloc, EditBookState>(
      buildWhen: (previous, current) => previous.isbn != current.isbn,
      builder: (context, state) {
        return TextFormField(
          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          keyboardType: TextInputType.number,
          decoration: const InputDecoration(
            labelText: 'ISBN',
            helperText: '',
          ),
          onChanged: (val) =>
              context.read<EditBookBloc>().add(EditBookIsbnChanged(val)),
        );
      },
    );
  }
}

class _DescriptionInput extends StatelessWidget {
  const _DescriptionInput({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EditBookBloc, EditBookState>(
      buildWhen: (previous, current) =>
          previous.description != current.description,
      builder: (context, state) {
        return TextFormField(
          keyboardType: TextInputType.text,
          textCapitalization: TextCapitalization.sentences,
          decoration: const InputDecoration(
            labelText: 'Description',
            helperText: '',
          ),
          onChanged: (val) =>
              context.read<EditBookBloc>().add(EditBookDescriptionChanged(val)),
        );
      },
    );
  }
}

class _PagesInput extends StatelessWidget {
  const _PagesInput({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EditBookBloc, EditBookState>(
      buildWhen: (previous, current) => previous.pages != current.pages,
      builder: (context, state) {
        return TextFormField(
          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          keyboardType: TextInputType.number,
          decoration: const InputDecoration(
            labelText: 'Pages',
            helperText: '',
          ),
          onChanged: (val) =>
              context.read<EditBookBloc>().add(EditBookPagesChanged(val)),
        );
      },
    );
  }
}

class _AuthorInput extends StatelessWidget {
  const _AuthorInput({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EditBookBloc, EditBookState>(
      buildWhen: (previous, current) => previous.authors != current.authors,
      builder: (context, state) {
        return TextFormField(
          keyboardType: TextInputType.name,
          textCapitalization: TextCapitalization.words,
          decoration: const InputDecoration(
            labelText: 'Author',
            helperText: '',
          ),
          onChanged: (val) =>
              context.read<EditBookBloc>().add(EditBookAuthorsChanged(val)),
        );
      },
    );
  }
}

class _BookTitleInput extends StatelessWidget {
  const _BookTitleInput({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EditBookBloc, EditBookState>(
      buildWhen: (previous, current) => previous.title != current.title,
      builder: (context, state) {
        return TextFormField(
          keyboardType: TextInputType.name,
          textCapitalization: TextCapitalization.words,
          decoration: const InputDecoration(
            labelText: 'Book Title',
            helperText: '',
          ),
          onChanged: (val) =>
              context.read<EditBookBloc>().add(EditBookTitleChanged(val)),
        );
      },
    );
  }
}
