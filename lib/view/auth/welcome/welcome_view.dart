import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:whollet_extensions/whollet_extensions.dart';
import 'package:whollet_flutter_app/components/components.dart';
import 'package:whollet_flutter_app/resources/icons.dart';
import 'package:whollet_flutter_app/view/auth/login/login_view.dart';

class WelcomeView extends StatefulWidget {
  const WelcomeView({super.key});

  static String get routeName => "/welcome";

  static Widget builder(BuildContext context) => const WelcomeView();

  @override
  State<WelcomeView> createState() => _WelcomeViewState();
}

class _WelcomeViewState extends State<WelcomeView> {
  @override
  Widget build(BuildContext context) {
    final colorScheme = context.colorScheme;
    final textTheme = context.theme.textTheme;
    return Scaffold(
      backgroundColor: colorScheme.primary,
      body: Column(
        children: [
          Expanded(
            child: Column(
              children: [
                Center(
                  child: SafeArea(
                    minimum:
                        calculateSafeAreaPadding(context: context, minimum: const EdgeInsetsDirectional.only(top: 80)),
                    child: SvgImageFromAsset(AuthIcons.welcomeLogo),
                  ),
                ),
                const Gap(24),
                Text(
                  "Welcome to",
                  style: textTheme.bodySmall?.copyWith(fontSize: 28, color: colorScheme.onPrimary.withOpacity(0.5)),
                ),
                Text(
                  "WHOLLET",
                  style: textTheme.bodySmall?.copyWith(
                    fontSize: 48,
                    color: colorScheme.onPrimary,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: context.bottomPadding),
            child: Column(
              children: [
                SecondaryButton(
                  onPressed: () => context.navigator.pushNamed(LoginView.routeName),
                  label: "Login",
                  dense: true,
                ),
                const Gap(16),
                RichText(
                  text: TextSpan(
                    text: "Don’t have an account? ",
                    style: textTheme.bodySmall?.copyWith(fontSize: 15, color: colorScheme.onSecondary),
                    children: [
                      TextSpan(
                        text: "Sign Up",
                        style: textTheme.labelLarge?.copyWith(fontSize: 15, color: colorScheme.onSecondary),
                        recognizer: TapGestureRecognizer()..onTap = () {},
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
