import 'dart:math' as math;

import 'package:core/core.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:whollet_extensions/whollet_extensions.dart';
import 'package:whollet_flutter_app/components/app_textfield.dart';
import 'package:whollet_flutter_app/components/components.dart';
import 'package:whollet_flutter_app/resources/images.dart';
import 'package:whollet_flutter_app/src/l10n/l10n.dart';
import 'package:whollet_flutter_app/view/auth/widget/app_header.dart';

part 'login_cubit.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  static String get routeName => "/login";

  static Widget builder(BuildContext context) => BlocProvider(
        create: (context) => LoginCubit(
          context,
          EmptyState(),
        ),
        child: const LoginView(),
      );

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormFieldState> _key = GlobalKey<FormFieldState>();

  @override
  Widget build(BuildContext context) {
    final colorScheme = context.colorScheme;
    final textTheme = context.theme.textTheme;
    final l10n = WholletLocalization.of(context);
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarBrightness: Brightness.dark,
        statusBarIconBrightness: Brightness.dark,
        statusBarColor: colorScheme.secondary,
        systemNavigationBarColor: colorScheme.onSecondary,
      ),
      child: AppHeader(
        title: "Welcome Back!",
        backgroundVector: AuthImages.loginVector,
        body: _LoginBody(
          emailController: _emailController,
          passwordController: _passwordController,
        ),
      ),
    );
  }
}

class _LoginBody extends StatelessWidget {
  final TextEditingController _emailController;
  final TextEditingController _passwordController;

  const _LoginBody({
    super.key,
    required TextEditingController emailController,
    required TextEditingController passwordController,
  })  : _emailController = emailController,
        _passwordController = passwordController;

  @override
  Widget build(BuildContext context) {
    final colorScheme = context.colorScheme;
    final textTheme = context.theme.textTheme;
    return Stack(
      children: [
        Container(
          padding: const EdgeInsetsDirectional.all(24),
          height: context.height / 2,
          decoration: BoxDecoration(
              color: colorScheme.onSecondary,
              borderRadius: const BorderRadiusDirectional.only(
                topStart: Radius.circular(24),
                topEnd: Radius.circular(24),
              )),
          child: Column(
            children: [
              SecureTextField(
                controller: _emailController,
                hintText: "Email address",
              ),
              const Gap(14),
              SecureTextField(
                controller: _passwordController,
                hintText: "Password",
              ),
              const Gap(14),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {},
                  child: Text(
                    "Forgot your password?",
                    style: textTheme.bodyLarge?.copyWith(color: colorScheme.primary),
                  ),
                ),
              ),
              // Add more widgets as needed
            ],
          ),
        ),
        Positioned(
          bottom: 25 + math.max(0, (context.mediaQuery.viewInsets.bottom - 62)),
          left: 0,
          right: 0,
          child: Center(
            child: PrimaryButton(
              onPressed: () {},
              label: "Login",
              dense: true,
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              text: "Don’t have an account? ",
              style: textTheme.bodySmall?.copyWith(fontSize: 15),
              children: [
                TextSpan(
                  text: "Sign Up",
                  style: textTheme.labelLarge?.copyWith(fontSize: 15, color: colorScheme.primary),
                  recognizer: TapGestureRecognizer()..onTap = () {},
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
