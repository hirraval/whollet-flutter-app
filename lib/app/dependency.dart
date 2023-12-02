import 'dart:async';

import 'package:data/data.dart';
import 'package:event_bus/event_bus.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:whollet_environment/whollet_environment.dart';
import 'package:whollet_flutter_app/utils/firebase_helper.dart';
import 'package:whollet_flutter_app/utils/notification_helper.dart';

class DependencyHelper {
  final Completer<bool> _initializeCompleter = Completer();
  final GetIt _getItInstance = GetIt.asNewInstance();

  static DependencyHelper? _instance;

  DependencyHelper._private() {
    _initDependencies();
  }

  Future<void> _initDependencies() async {
    _getItInstance
      ..registerSingleton<RouteObserver>(RouteObserver())
      ..registerSingleton(FirebaseHelper())
      ..registerSingleton(NotificationHelper())
      ..registerSingleton<WholletEnvironment>(WholletEnvironment.fromArguments())
      ..registerSingleton<EventBus>(EventBus());
    await initializeDataLayer(_getItInstance);
    _initializeCompleter.complete(true);
  }

  factory DependencyHelper.getInstance() => _instance ??= DependencyHelper._private();

  FutureOr<void> initialize() async {
    await _initializeCompleter.future;
  }

  T call<T extends Object>({String? instanceName}) {
    assert(_initializeCompleter.isCompleted);
    return _getItInstance<T>(instanceName: instanceName);
  }

  T get<T extends Object>({String? instanceName}) => this<T>(instanceName: instanceName);
}
