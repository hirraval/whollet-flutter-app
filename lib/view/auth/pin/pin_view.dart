import 'package:core/core.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whollet_extensions/whollet_extensions.dart';
import 'package:whollet_flutter_app/components/components.dart';
import 'package:whollet_flutter_app/view/auth/widget/passcode/passcode.dart';

part 'pin_cubit.dart';

part 'pin_state.dart';

class PinView extends StatefulWidget {
  const PinView({super.key});

  static String get routeName => "/pin";

  static Widget builder(BuildContext context) => BlocProvider(
        create: (context) => PinCubit(context, PinState()),
        child: const PinView(),
      );

  @override
  State<PinView> createState() => _PinViewState();
}

class _PinViewState extends State<PinView> {
  @override
  Widget build(BuildContext context) {
    final colorScheme = context.colorScheme;
    final textTheme = context.theme.textTheme;
    return Scaffold(
      backgroundColor: colorScheme.onSurfaceVariant,
      appBar: AppBar(
        backgroundColor: colorScheme.onSurfaceVariant,
        leading: const LeadingBackButton(),
        centerTitle: true,
        title: Column(
          children: [
            Text(
              "Verification Required",
              style: textTheme.titleLarge?.copyWith(fontSize: 26),
            ),
            Text(
              "Please enter your PIN to proceed",
              style: textTheme.bodySmall?.copyWith(fontSize: 15),
            ),
          ],
        ),
      ),
      body: PasscodeInputView(
        controller: PasscodeInputController(4),
      ),
    );
  }
}
