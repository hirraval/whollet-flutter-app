
import 'package:data/data.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whollet_extensions/whollet_extensions.dart';
import 'package:whollet_flutter_app/basic/alerts.dart';
import 'package:whollet_flutter_app/components/components.dart';
import 'dart:developer' as developer;

import 'package:whollet_flutter_app/src/l10n/l10n.dart';

import 'user/user_cubit.dart';

class AppBlocObserver extends BlocObserver {
  final GlobalKey<NavigatorState> _navigatorKey;
  final bool _enableLogs = kDebugMode;

  AppBlocObserver({required GlobalKey<NavigatorState> navigatorKey}) : _navigatorKey = navigatorKey;

  @override
  void onCreate(BlocBase bloc) {
    super.onCreate(bloc);
    if (_enableLogs) developer.log('onCreate(${bloc.runtimeType}, ${bloc.state})');
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    if (_enableLogs) developer.log('onChange(${bloc.runtimeType}, $change)');
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    if (_enableLogs) developer.log('onError(${bloc.runtimeType}, $error, $stackTrace)');
    if (error is ApiException) _handleApiException(error);
    super.onError(bloc, error, stackTrace);
  }

  void _handleApiException(ApiException exception) {
    var context = _navigatorKey.currentContext;
    if (context == null) return;

    switch (exception) {
      case TimeoutException():
        return showErrorMessage(
          context: context,
          title: context.l10n.errorTitle,
          content: context.l10n.timeoutErrorMessage,
        );

      case InternetConnectionException():
        return showErrorMessage(
          context: context,
          title: context.l10n.errorTitle,
          content: context.l10n.noInternetErrorMessage,
        );

      case UnauthorizedException():
        UserCubit.of(context).userUnauthorized();
        context.navigator.pushNamedAndRemoveUntil("", (route) => false);
        ScaffoldMessenger.of(context).clearSnackBars();
        return showErrorMessage(
          context: context,
          title: context.l10n.userUnauthorizedErrorTitle,
          content: context.l10n.userUnauthorizedErrorMessage,
        );

      case ApiResponseException(errors: Map<String, dynamic>? errors, message: String? message):
        if (errors != null && errors.isNotEmpty) {
          String error = errors.entries.fold("", (previousValue, element) => "$previousValue• ${element.value}\n");

          showAppModal(
            context: context,
            builder: (context) => ErrorModal(
              title: context.l10n.errorTitle,
              content: error,
              button: (label: context.l10n.okayButtonLabel, onPressed: null),
            ),
          );
          return;
        }

        showErrorMessage(
          context: context,
          title: context.l10n.errorTitle,
          content: message != null && message.isNotEmpty ? message : context.l10n.somethingWentWrongErrorMessage,
        );
        break;

    }
  }
}
