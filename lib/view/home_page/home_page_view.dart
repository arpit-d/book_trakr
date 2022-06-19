import 'package:book_tracker/app/bloc/app_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({Key? key}) : super(key: key);
  static Page page() => const MaterialPage<void>(child: Dashboard());

  @override
  Widget build(BuildContext context) {
    final user = context.select((AppBloc bloc) => bloc.state.user);
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                context.read<AppBloc>().add(AppLogoutRequested());
              },
              icon: const Icon(
                Icons.logout,
              ))
        ],
      ),
      body: Center(
        child: Text(user.email.toString()),
      ),
    );
  }
}
