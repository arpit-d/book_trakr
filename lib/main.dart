import 'dart:io';

import 'package:book_tracker/app/bloc/app_bloc.dart';
import 'package:book_tracker/app/core/app_theme.dart';
import 'package:book_tracker/app_observer.dart';

import 'package:book_tracker/data/repository/auth_repository.dart';
import 'package:book_tracker/view/authentication/auth_view.dart';
import 'package:book_tracker/view/home_page/home_page_view.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flow_builder/flow_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<void> main() {
  // SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
  //   statusBarColor: Colors.transparent,
  //   systemNavigationBarColor: Colors.black, // navigation bar color
  //   statusBarIconBrightness: Brightness.dark, // status bar icons' color
  //   systemNavigationBarIconBrightness:
  //       Brightness.dark, // transparent status bar
  // ));
  return BlocOverrides.runZoned(
    () async {
      // Since Firebase needs to call native code before to be initialized, this line of code makes sure
      // we have an instance of,the WidgetsBinding,
      // which is required to use platform channels to call the native code.
      WidgetsFlutterBinding.ensureInitialized();
      // Initializes Firebase

      if (!Platform.isWindows) {
        // Initializes Firebase
        await Firebase.initializeApp();
        // Creates an instance of the [AuthRepository] class
        final authenticationRepository = AuthRepository();
        await authenticationRepository.user.first;
        runApp(App(authenticationRepository: authenticationRepository));
      }

      if (Platform.isWindows) runApp(const AppWidget());
    },
    blocObserver: AppBlocObserver(),
  );
}

class App extends StatelessWidget {
  const App({
    Key? key,
    required AuthRepository authenticationRepository,
  })  : _authenticationRepository = authenticationRepository,
        super(key: key);

  final AuthRepository _authenticationRepository;
  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: _authenticationRepository,
      child: BlocProvider(
        create: (_) => AppBloc(
          authenticationRepository: _authenticationRepository,
        ),
        child: const AppWidget(),
      ),
    );
  }
}

class AppWidget extends StatelessWidget {
  const AppWidget({
    Key? key,
  }) : super(key: key);
  List<Page> onGenerateAppViewPages(
      AppStatus state, List<Page<dynamic>> pages) {
    switch (state) {
      case AppStatus.authenticated:
        return [Dashboard.page()];
      case AppStatus.unauthenticated:
        return [AuthView.page()];
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.lightTheme,
      debugShowCheckedModeBanner: false,
      home: Platform.isWindows
          ? const Dashboard()
          : FlowBuilder<AppStatus>(
              state: context.select((AppBloc bloc) => bloc.state.status),
              onGeneratePages: onGenerateAppViewPages),
    );
  }
}
