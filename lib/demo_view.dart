import 'package:flutter/material.dart';
import 'package:whollet_flutter_app/components/app_buttons.dart';

class DemoView extends StatefulWidget {
  const DemoView({super.key});

  static String get routeName => "/demo";

  static Widget builder(BuildContext context) => const DemoView();

  @override
  State<DemoView> createState() => _DemoViewState();
}

class _DemoViewState extends State<DemoView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ErrorButton(onPressed: () {

            }, label: "label",dense: true,)
          ],
        ),
      ),
    );
  }
}
