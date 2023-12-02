import 'package:data/data.dart';
import 'package:flutter/material.dart';
import 'package:whollet_flutter_app/app/route/route_info.dart';
import 'package:whollet_flutter_app/demo_view.dart';
import 'package:whollet_flutter_app/view/auth/onboarding/onboarding.dart';
import 'package:whollet_flutter_app/view/auth/welcome/welcome_view.dart';

class AppRouteGenerator {
  final AppPreference preference;

  AppRouteGenerator(this.preference);

  Route? call(RouteSettings settings) {
    var routeName = settings.name;
    var routeInfo = _routes[routeName];
    if (routeInfo == null) return null;
    return routeInfo(settings);
  }

  String get initialRoute {
    return OnBoardingView.routeName;
  }

  final _routes = <String, RouteInfo>{
    DemoView.routeName: const MaterialRouteInfo(
      builder: DemoView.builder,
    ),
    OnBoardingView.routeName: const MaterialRouteInfo(
      builder: OnBoardingView.builder,
    ),
    WelcomeView.routeName: const MaterialRouteInfo(
      builder: WelcomeView.builder,
    )
  };
}
