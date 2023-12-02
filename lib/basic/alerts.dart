import 'package:flutter/material.dart';
import 'package:whollet_flutter_app/resources/resources.dart';

import '../components/components.dart';

void showSuccessMessage({required BuildContext context, required String title, required String content}) {
  ScaffoldMessenger.of(context).clearSnackBars();
  ScaffoldMessenger.of(context).showSnackBar(AlertMessage(
    title: title,
    description: content,
    backgroundColor: context.appColor.successContainer,
    foregroundColor: context.appColor.success,
  ));
}

void showErrorMessage({required BuildContext context, required String title, required String content}) {
  ScaffoldMessenger.of(context).clearSnackBars();
  ScaffoldMessenger.of(context).showSnackBar(AlertMessage(
    title: title,
    description: content,
    backgroundColor: context.appColor.failureContainer,
    foregroundColor: context.appColor.failure,
  ));
}
