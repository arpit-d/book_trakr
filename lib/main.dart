import 'dart:io';

import 'package:book_tracker/features/books_overview/bloc/book_overview_bloc.dart';
import 'package:book_tracker/features/books_overview/repository/books_overview_repository.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flow_builder/flow_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'app_observer.dart';
import 'core/styles/styles.dart';
import 'features/app/blocs/app_bloc/app_bloc.dart';
import 'features/authentication/auth_view.dart';
import 'features/authentication/repository/auth_repository.dart';
import 'features/edit_book/repository/book_repository.dart';
import 'features/app/view/home_page_view.dart';

Future<void> main() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    systemNavigationBarColor: Colors.black, // navigation bar color
    statusBarIconBrightness: Brightness.dark, // status bar icons' color
    systemNavigationBarIconBrightness:
        Brightness.dark, // transparent status bar
  ));
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
        child: MultiRepositoryProvider(
          providers: [
            RepositoryProvider(
              create: (context) => BookRepository(
                  userModel: _authenticationRepository.currentUser),
            ),
            RepositoryProvider(
              create: (context) => BookOverviewRepository(
                  userModel: _authenticationRepository.currentUser),
            ),
          ],
          child: const AppWidget(),
        ),
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
          : MultiBlocProvider(
              providers: [
                BlocProvider(
                  create: (context) => BookOverviewBloc(
                      bookOverviewRepository:
                          context.read<BookOverviewRepository>()),
                ),
              ],
              child: FlowBuilder<AppStatus>(
                  state: context.select((AppBloc bloc) => bloc.state.status),
                  onGeneratePages: onGenerateAppViewPages),
            ),
    );
  }
}
