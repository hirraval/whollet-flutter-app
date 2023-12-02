import 'package:core/core.dart';
import 'package:flutter/material.dart';

abstract class RouteInfo {
  final WidgetBuilder builder;
  final bool fullScreenDialog;
  final bool authRequired;

  const RouteInfo(
      {required this.builder,
      this.fullScreenDialog = false,
      this.authRequired = true});

  Route call(RouteSettings settings);
}

class MaterialRouteInfo extends RouteInfo {
  const MaterialRouteInfo({
    required super.builder,
    super.authRequired,
    super.fullScreenDialog,
  });

  @override
  Route call(RouteSettings settings) {
    "${settings.name} -> ${settings.arguments}".debug();
    return MaterialPageRoute<Object?>(
      builder: builder,
      settings: settings,
      fullscreenDialog: fullScreenDialog,
    );
  }
}

class FadeRouteInfo extends RouteInfo {
  const FadeRouteInfo({
    required super.builder,
    super.authRequired,
    super.fullScreenDialog,
  });

  @override
  Route call(RouteSettings settings) {
    return PageRouteBuilder<Object?>(
      pageBuilder: (context, animation, secondaryAnimation) => builder(context),
      settings: settings,
      fullscreenDialog: fullScreenDialog,
      transitionDuration: const Duration(milliseconds: 500),
      transitionsBuilder: (context, animation, secondaryAnimation, child) =>
          FadeTransition(
        opacity: animation,
        child: child,
      ),
    );
  }
}

class SlideRouteInfo extends RouteInfo {
  const SlideRouteInfo({
    required super.builder,
    super.authRequired,
    super.fullScreenDialog,
  });

  @override
  Route call(RouteSettings settings) {
    return PageRouteBuilder<Object?>(
      pageBuilder: (context, animation, secondaryAnimation) => builder(context),
      settings: settings,
      fullscreenDialog: fullScreenDialog,
      transitionDuration: const Duration(milliseconds: 300),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(1, 0);
        const end = Offset.zero;
        final tween = Tween(begin: begin, end: end);
        final offsetAnimation = animation.drive(tween);

        return SlideTransition(
          position: offsetAnimation,
          child: child,
        );
      },
    );
  }
}

class ScaleRouteInfo extends RouteInfo {
  const ScaleRouteInfo({
    required super.builder,
    super.authRequired,
    super.fullScreenDialog,
  });

  @override
  Route call(RouteSettings settings) {
    return PageRouteBuilder<Object?>(
      pageBuilder: (context, animation, secondaryAnimation) => builder(context),
      settings: settings,
      fullscreenDialog: fullScreenDialog,
      transitionDuration: const Duration(milliseconds: 500),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return ScaleTransition(
          scale: animation,
          child: child,
        );
      },
    );
  }
}
