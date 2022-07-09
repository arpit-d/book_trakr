import 'package:book_tracker/app/bloc/app_bloc.dart';
import 'package:book_tracker/app/core/app_colors.dart';
import 'package:book_tracker/app/core/app_icons.dart';
import 'package:book_tracker/view/home_page/trending_books_list/view/trending_books_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({Key? key}) : super(key: key);

  static Page page() => const MaterialPage<void>(child: Dashboard());

  @override
  Widget build(BuildContext context) {
    final user = context.select((AppBloc bloc) => bloc.state.user);
    return Scaffold(
      drawer: const Drawer(),
      appBar: AppBar(
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
      body: Column(
        children: [
          const TrendingBooksList(),
          Center(
            child: Text(user.email.toString()),
          ),
        ],
      ),
    );
  }
}
