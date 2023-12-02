import 'package:flutter/material.dart';
import 'package:whollet_flutter_app/app/app.dart';

import 'bootstrap.dart';

void main() {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  bootstrap(
    () => WholletApp(navigatorKey: navigatorKey),
    blocObserver: AppBlocObserver(navigatorKey: navigatorKey),
  );
}
