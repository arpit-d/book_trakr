import 'package:book_tracker/app/bloc/app_bloc.dart';
import 'package:book_tracker/app/core/app_colors.dart';
import 'package:book_tracker/app/core/app_icons.dart';
import 'package:book_tracker/app/core/gaps.dart';
import 'package:book_tracker/view/home_page/trending_books_list/view/trending_books_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

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
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            _SearchTextField(),
            gapH16,
            TrendingBooksList(),
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
        labelText: 'Search',
        suffixIcon: Icon(LineAwesomeIcons.search),
      ),
    );
  }
}
