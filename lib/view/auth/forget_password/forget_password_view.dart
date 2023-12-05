import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'forget_password_cubit.dart';

class ForgetPasswordView extends StatefulWidget {
  const ForgetPasswordView({super.key});

  static String get routeName => "/forget_password";

  static Widget builder(BuildContext context) => BlocProvider(
        create: (context) => ForgetPasswordCubit(context, EmptyState()),
        child: const ForgetPasswordView(),
      );

  @override
  State<ForgetPasswordView> createState() => _ForgetPasswordViewState();
}

class _ForgetPasswordViewState extends State<ForgetPasswordView> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}
