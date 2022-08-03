import 'package:book_tracker/features/books_overview/view/books_overview_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

import '../../../core/styles/styles.dart';
import '../../../core/utils/utils.dart';
import '../../../core/widgets/widgets.dart';
import '../../edit_book/view/add_book/edit_book_view.dart';
import '../../trending_books/view/trending_books_list_view.dart';
import '../blocs/app_bloc/app_bloc.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({Key? key}) : super(key: key);

  static Page page() => const MaterialPage<void>(child: Dashboard());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.of(context).push(EditBookView.route()),
        child: const Icon(
          bookIcon,
          color: Colors.white,
        ),
      ),
      //  drawer: const Drawer(),
      appBar: AppBar(
        primary: true,
        title: const Text(
          "Books",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24,
            letterSpacing: 1.1,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              context.read<AppBloc>().add(AppLogoutRequested());
            },
            icon: const Icon(
              notificationBellIcon,
              color: AppColors.darkGreyColor,
            ),
          ),
          IconButton(
            onPressed: () {
              context.read<AppBloc>().add(AppLogoutRequested());
            },
            icon: const Icon(
              signOutIcon,
              color: AppColors.darkGreyColor,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 2),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            _SearchTextField(),
            gapH16,
            TitleWidget(title: "Trending Books"),
            gapH12,
            TrendingBooksList(),
            gapH12,
            BookOverviewView(),
          ],
        ),
      ),
    );
  }
}

class _SearchTextField extends StatelessWidget {
  const _SearchTextField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const TextField(
      decoration: InputDecoration(
        floatingLabelBehavior: FloatingLabelBehavior.never,
        labelText: 'Search',
        hintText: 'Search for a book...',
        suffixIcon: Icon(LineAwesomeIcons.search),
      ),
    );
  }
}
