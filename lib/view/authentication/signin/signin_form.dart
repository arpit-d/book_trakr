import 'package:book_tracker/app/cubit/login_cubit.dart';
import 'package:book_tracker/constants/enums.dart';
import 'package:book_tracker/view/widgets/square_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../app/core/gaps.dart';

class SignInForm extends StatelessWidget {
  const SignInForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
        listener: (context, state) {
          if (state.status == FormStatus.submissionFailure) {
            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(
                SnackBar(
                  content: Text(state.errorMessage ?? 'Authentication Failure'),
                ),
              );
          } else if (state.status == FormStatus.submissionSuccess) {
            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(
                const SnackBar(
                  content: Text('Succesfully Logged In!'),
                ),
              );
          }
        },
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: const [
                _LoginHeader(),
                _EmailInput(),
                _PasswordInput(),
                gapH16,
                _LoginButton(),
                gapH16,
                _GoogleButton()
              ],
            ),
          ),
        ));
  }
}

class _LoginHeader extends StatelessWidget {
  const _LoginHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Text(
          'Welcome Back,',
          style: TextStyle(fontSize: 24),
        ),
        Text(
          'Reader',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}

class _EmailInput extends StatelessWidget {
  const _EmailInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      buildWhen: (previous, current) => previous.email != current.email,
      builder: (context, state) {
        return TextFormField(
          validator: (_) => state.isEmailValid ? null : 'Invalid Email',
          onChanged: (email) => context.read<LoginCubit>().emailChanged(email),
          keyboardType: TextInputType.emailAddress,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          decoration: const InputDecoration(
            labelText: 'email',
            helperText: '',
          ),
        );
      },
    );
  }
}

class _PasswordInput extends StatelessWidget {
  const _PasswordInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      buildWhen: (previous, current) => previous.password != current.password,
      builder: (context, state) {
        return TextFormField(
          validator: (_) => state.isPasswordValid ? null : 'Invalid Password',
          onChanged: (value) =>
              context.read<LoginCubit>().passwordChanged(value),
          keyboardType: TextInputType.visiblePassword,
          obscureText: true,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          decoration: const InputDecoration(
            helperText: '',
            labelText: 'password',
          ),
        );
      },
    );
  }
}

class _LoginButton extends StatelessWidget {
  const _LoginButton({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      //   buildWhen: (previous, current) => previous.status != current.status,
      builder: (context, state) {
        // debugPrint("Is Email Valid? ${state.isEmailValid}");
        // debugPrint("Email: ${state.email}");
        // debugPrint("Is Password Valid? ${state.isPasswordValid}");
        // debugPrint("Password: ${state.password}");
        debugPrint("Form Valid in UI: ${state.status.toString()}");
        return state.status == FormStatus.submissionInProgress
            ? const CircularProgressIndicator()
            : SquareButton(
                isDisabled: false,
                title: 'Login',
                onPressed: () => state.status == FormStatus.valid
                    ? context.read<LoginCubit>().login()
                    : null,
              );

        // ElevatedButton(
        //     key: const Key('loginForm_continue_raisedButton'),
        //     style: ElevatedButton.styleFrom(
        //       shape: RoundedRectangleBorder(
        //         borderRadius: BorderRadius.circular(30),
        //       ),
        //       primary: const Color(0xFFFFD600),
        //     ),
        //     onPressed: () => context.read<LoginCubit>().login(),
        //     child: const Text('LOGIN'),
        //   );
      },
    );
  }
}

class _GoogleButton extends StatelessWidget {
  const _GoogleButton({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      buildWhen: (previous, current) => previous.status != current.status,
      builder: (context, state) {
        return SquareButton(
          color: Colors.black,
          isDisabled: false,
          title: 'Login With Google',
          onPressed: () => context.read<LoginCubit>().logInWithGoogle(),
        );

        // ElevatedButton(
        //     key: const Key('loginForm_continue_raisedButton'),
        //     style: ElevatedButton.styleFrom(
        //       shape: RoundedRectangleBorder(
        //         borderRadius: BorderRadius.circular(30),
        //       ),
        //       primary: const Color(0xFFFFD600),
        //     ),
        //     onPressed: () => context.read<LoginCubit>().login(),
        //     child: const Text('LOGIN'),
        //   );
      },
    );
  }
}
