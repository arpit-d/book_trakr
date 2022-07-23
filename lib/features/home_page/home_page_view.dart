import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

import '../../core/gaps.dart';
import '../../core/styles/styles.dart';
import '../app/bloc/app_bloc.dart';
import 'trending_books_list/view/trending_books_list_view.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({Key? key}) : super(key: key);

  static Page page() => const MaterialPage<void>(child: Dashboard());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            _TitleWidget(title: "Trending Books"),
            gapH12,
            TrendingBooksList(),
          ],
        ),
      ),
    );
  }
}

class _TitleWidget extends StatelessWidget {
  const _TitleWidget({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 20,
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
