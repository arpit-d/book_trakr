import 'package:book_tracker/app/cubit/cubit/signup_cubit.dart';
import 'package:book_tracker/app/cubit/login_cubit.dart';
import 'package:book_tracker/data/repository/auth_repository.dart';
import 'package:book_tracker/view/authentication/signin/signin_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'signup/signup_form.dart';

class AuthView extends StatefulWidget {
  const AuthView({Key? key}) : super(key: key);

  static Page page() => const MaterialPage<void>(child: AuthView());

  @override
  State<AuthView> createState() => _AuthViewState();
}

class _AuthViewState extends State<AuthView> with TickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(100.0),
        child: Align(
          alignment: Alignment.centerLeft,
          child: TabBar(
            isScrollable: true,
            labelStyle: TextStyle(
              color: Theme.of(context).primaryColor,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.1,
              fontSize: 22,
            ),
            unselectedLabelStyle: const TextStyle(color: Colors.grey),
            indicatorColor: Theme.of(context).primaryColor,
            indicatorSize: TabBarIndicatorSize.label,
            controller: _tabController,
            tabs: const [
              Tab(
                child: Text(
                  'Login',
                ),
              ),
              Tab(
                child: Text(
                  'Sign Up',
                ),
              ),
            ],
          ),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          BlocProvider(
            create: (_) => LoginCubit(context.read<AuthRepository>()),
            child: const SignInForm(),
          ),
          BlocProvider(
            create: (_) => SignUpCubit(context.read<AuthRepository>()),
            child: const SignUpForm(),
          ),
        ],
      ),
    );
  }
}
