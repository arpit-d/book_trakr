import 'package:book_tracker/app/core/app_icons.dart';
import 'package:book_tracker/constants/enums.dart';
import 'package:book_tracker/features/widgets/square_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

import '../../../app/core/gaps.dart';
import '../../../app/core/snackbars.dart';
import 'cubit/signup_cubit.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignUpCubit, SignUpState>(
      listener: (context, state) {
        if (state.status == FormStatus.submissionSuccess) {
          Navigator.of(context).pop();
          showSnackbar(
            context,
            message: 'Succesfully Logged In!',
            snackbarType: SnackbarType.success,
          );
        } else if (state.status == FormStatus.submissionFailure) {
          showSnackbar(
            context,
            message: state.errorMessage ?? 'Sign Up Failure',
            snackbarType: SnackbarType.success,
          );
        }
      },
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: const [
              _LoginHeader(),
              gapH16,
              _EmailInput(),
              gapH8,
              _PasswordInput(),
              gapH8,
              _ConfirmPasswordInput(),
              gapH16,
              _SignUpButton(),
            ],
          ),
        ),
      ),
    );
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
          'Keep Track of your Reading With Ease',
          style: TextStyle(fontSize: 24),
        ),
      ],
    );
  }
}

class _EmailInput extends StatelessWidget {
  const _EmailInput({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpCubit, SignUpState>(
      buildWhen: (previous, current) => previous.email != current.email,
      builder: (context, state) {
        return TextFormField(
          onChanged: (email) => context.read<SignUpCubit>().emailChanged(email),
          validator: (_) => state.isEmailValid ? null : 'Invalid Email',
          keyboardType: TextInputType.emailAddress,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          decoration: const InputDecoration(
            suffixIcon: Icon(LineAwesomeIcons.envelope),
            labelText: 'email',
            helperText: '',
          ),
        );
      },
    );
  }
}

class _PasswordInput extends StatelessWidget {
  const _PasswordInput({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpCubit, SignUpState>(
      buildWhen: (previous, current) => previous.password != current.password,
      builder: (context, state) {
        return TextFormField(
          onChanged: (password) =>
              context.read<SignUpCubit>().passwordChanged(password),
          validator: (_) => state.isPasswordValid ? null : 'Invalid Password',
          obscureText: true,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          decoration: const InputDecoration(
            suffixIcon: Icon(passwordIcon),
            labelText: 'password',
            helperText: '',
          ),
        );
      },
    );
  }
}

class _ConfirmPasswordInput extends StatelessWidget {
  const _ConfirmPasswordInput({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpCubit, SignUpState>(
      buildWhen: (previous, current) =>
          previous.password != current.password ||
          previous.confirmedPassword != current.confirmedPassword,
      builder: (context, state) {
        return TextFormField(
          onChanged: (confirmPassword) => context
              .read<SignUpCubit>()
              .confirmedPasswordChanged(confirmPassword),
          validator: (_) =>
              state.isConfirmedPasswordValid ? null : 'Passwords do not match',
          obscureText: true,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          decoration: const InputDecoration(
            suffixIcon: Icon(passwordIcon),
            labelText: 'confirm password',
            helperText: '',
          ),
        );
      },
    );
  }
}

class _SignUpButton extends StatelessWidget {
  void _signUpButtonPressed(BuildContext context) {
    FocusScopeNode currentFocus = FocusScope.of(context);
    if (!currentFocus.hasPrimaryFocus && currentFocus.focusedChild != null) {
      currentFocus.focusedChild!.unfocus();
    }
    context.read<SignUpCubit>().signUpFormSubmitted();
  }

  const _SignUpButton({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpCubit, SignUpState>(
      buildWhen: (previous, current) => previous.status != current.status,
      builder: (context, state) {
        return state.status == FormStatus.submissionInProgress
            ? const Center(child: CircularProgressIndicator())
            : SquareButton(
                isDisabled: false,
                title: 'Sign Up',
                onPressed: () => _signUpButtonPressed(context),
              );
      },
    );
  }
}
