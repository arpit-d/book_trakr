import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/utils.dart';
import '../../../../core/styles/styles.dart';
import '../../../../core/widgets/widgets.dart';
import '../../../app/blocs/app_bloc/app_bloc.dart';
import '../../bloc/edit_book_bloc.dart';

class AddBookForm extends StatelessWidget {
  const AddBookForm({Key? key}) : super(key: key);
  static final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EditBookBloc, EditBookState>(
      builder: (context, state) {
        return Form(
          key: _formKey,
          child: Column(
            children: [
              IconButton(
                onPressed: () {
                  context.read<AppBloc>().add(AppLogoutRequested());
                },
                icon: const Icon(
                  signOutIcon,
                  color: AppColors.darkGreyColor,
                ),
              ),
              TextFormField(
                onChanged: (val) => BlocProvider.of<EditBookBloc>(context)
                    .add(EditBookTitleChanged(val)),
              ),
              gapH8,
              TextFormField(
                onChanged: (val) => BlocProvider.of<EditBookBloc>(context)
                    .add(EditBookAuthorsChanged(val)),
              ),
              gapH8,
              TextFormField(),
              gapH16,
              SquareButton(
                title: 'Add Book',
                onPressed: () {},
                isDisabled: false,
              ),
            ],
          ),
        );
      },
    );
  }
}
