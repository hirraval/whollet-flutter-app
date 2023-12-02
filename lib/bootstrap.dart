import 'dart:async';
import 'dart:io';

import 'package:core/core.dart';
import 'package:data/data.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';
import 'package:whollet_flutter_app/src/l10n/generated/l10n.dart';

import 'app/dependency.dart';
import 'app/localization/localization_cubit.dart';
import 'app/user/user_cubit.dart';
import 'utils/firebase_helper.dart';

Future<void> bootstrap(
    FutureOr<Widget> Function() builder, {
      required BlocObserver blocObserver,
    }) async {
  return runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();

    DependencyHelper dependencyHelper = DependencyHelper.getInstance();
    await dependencyHelper.initialize();

    final firebaseHelper = dependencyHelper<FirebaseHelper>();
    Bloc.observer = blocObserver;
    await _initHydratedStorage();

    // Record flutter errors in firebase crashlytics
    var defaultFlutterErrorHandler = FlutterError.onError;
    FlutterError.onError = (details) {
      firebaseHelper.recordFlutterError(details);
      defaultFlutterErrorHandler?.call(details);
    };

    // Record async errors in firebase crashlytics
    var defaultPlatformErrorHandler = PlatformDispatcher.instance.onError;
    PlatformDispatcher.instance.onError = (error, stack) {
      firebaseHelper.recordError(error, stack);
      return defaultPlatformErrorHandler?.call(error, stack) ?? false;
    };

    // Set system ui appearance & behaviours for app
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    SystemChrome.setPreferredOrientations(DeviceOrientation.values);
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarColor: Colors.transparent,
        systemNavigationBarDividerColor: Colors.transparent,
        systemNavigationBarIconBrightness: Brightness.dark,
        systemNavigationBarContrastEnforced: false,
        systemStatusBarContrastEnforced: false,
      ),
    );

    final preference = dependencyHelper<AppPreference>();
    final userState = UserState(user: preference.user, isLogin: preference.isLogin);

    return runApp(MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => UserCubit(context, userState), lazy: false),
        BlocProvider(
          create: (context) => LocalizationCubit.fromSystem(
            localizationsDelegate: WholletLocalization.delegate,
            preference: preference,
          ),
        ),
      ],
      child: await builder(),
    ));
  }, (error, stackTrace) {
    Log.error(error);
    Log.error(stackTrace);
  });
}

Future<void> _initHydratedStorage() async {
  final Directory storageDirectory;
  if (kIsWeb) {
    storageDirectory = HydratedStorage.webStorageDirectory;
  } else {
    storageDirectory = await getApplicationSupportDirectory()
        .then((value) => Directory(path.join(value.path, "com.azsecurity", "StateCache")));
  }
  HydratedBloc.storage = await HydratedStorage.build(storageDirectory: storageDirectory);
}
