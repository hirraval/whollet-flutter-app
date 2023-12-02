import 'package:data/data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:whollet_flutter_app/app/localization/localization_cubit.dart';
import 'package:whollet_flutter_app/resources/resources.dart';
import 'package:whollet_flutter_app/src/l10n/l10n.dart';

import 'dependency.dart';
import 'route/route_generator.dart';

export 'bloc_observer.dart';
export 'user/user_cubit.dart';

class WholletApp extends StatefulWidget {
  final GlobalKey<NavigatorState> navigatorKey;

  const WholletApp({super.key, required this.navigatorKey});

  @override
  State<WholletApp> createState() => _WholletAppState();
}

class _WholletAppState extends State<WholletApp> {
  final DependencyHelper _dependencyHelper = DependencyHelper.getInstance();
  late final _routeObserver = _dependencyHelper<RouteObserver>();
  late final _routeGenerator =
      AppRouteGenerator(_dependencyHelper<AppPreference>());

  @override
  Widget build(BuildContext context) {
    final language = context.select<LocalizationCubit, Language>(
        (value) => value.state.selectedLanguage);
    return MaterialApp(
      restorationScopeId: 'AzSecurityApp',
      onGenerateTitle: (context) => context.l10n.appName,
      navigatorKey: widget.navigatorKey,
      navigatorObservers: [_routeObserver],
      onGenerateRoute: _routeGenerator,
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light,
      theme: AppTheme.lightTheme,
      locale: Locale(language.languageCode),
      initialRoute: _routeGenerator.initialRoute,
      supportedLocales: WholletLocalization.delegate.supportedLocales,
      localizationsDelegates: const [
        WholletLocalization.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
    );
  }
}
