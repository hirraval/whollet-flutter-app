import 'dart:math' as math;

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

extension EdgeInsetsDirectionalExt on EdgeInsets {
  EdgeInsetsDirectional toDirectional(BuildContext context) {
    assert(debugCheckHasDirectionality(context));
    final TextDirection textDirection = Directionality.of(context);
    final double start = textDirection == TextDirection.ltr ? left : right;
    final double end = textDirection == TextDirection.rtl ? left : right;

    return EdgeInsetsDirectional.fromSTEB(start, top, end, bottom);
  }
}

EdgeInsets calculateSafeAreaPadding({
  required BuildContext context,
  EdgeInsetsGeometry minimum = EdgeInsets.zero,
  bool start = true,
  bool top = true,
  bool end = true,
  bool bottom = true,
}) {
  assert(debugCheckHasMediaQuery(context));
  assert(debugCheckHasDirectionality(context));

  final TextDirection textDirection = Directionality.of(context);
  final bool left = textDirection == TextDirection.ltr ? start : end;
  final bool right = textDirection == TextDirection.rtl ? start : end;

  final EdgeInsets padding = MediaQuery.of(context).padding;
  final EdgeInsets effectiveMinimum = minimum.resolve(textDirection);

  return EdgeInsets.only(
    left: math.max(left ? padding.left : 0.0, effectiveMinimum.left),
    top: math.max(top ? padding.top : 0.0, effectiveMinimum.top),
    right: math.max(right ? padding.right : 0.0, effectiveMinimum.right),
    bottom: math.max(bottom ? padding.bottom : 0.0, effectiveMinimum.bottom),
  );
}

class SliverDirectionalSafeArea extends StatelessWidget {
  final bool start;
  final bool top;
  final bool end;
  final bool bottom;
  final EdgeInsetsGeometry minimum;
  final Widget sliver;

  const SliverDirectionalSafeArea({
    super.key,
    this.start = true,
    this.top = true,
    this.end = true,
    this.bottom = true,
    this.minimum = EdgeInsets.zero,
    required this.sliver,
  });

  @override
  Widget build(BuildContext context) {
    assert(debugCheckHasDirectionality(context));
    final TextDirection textDirection = Directionality.of(context);
    final EdgeInsets effectiveMinimum = minimum.resolve(textDirection);

    return SliverSafeArea(
      top: top,
      bottom: bottom,
      left: textDirection == TextDirection.ltr ? start : end,
      right: textDirection == TextDirection.rtl ? start : end,
      minimum: effectiveMinimum,
      sliver: sliver,
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(FlagProperty('start', value: start, ifTrue: 'avoid start padding'));
    properties.add(FlagProperty('top', value: top, ifTrue: 'avoid top padding'));
    properties.add(FlagProperty('end', value: end, ifTrue: 'avoid end padding'));
    properties.add(FlagProperty('bottom', value: bottom, ifTrue: 'avoid bottom padding'));
  }
}

class DirectionalSafeArea extends StatelessWidget {
  final bool start;
  final bool top;
  final bool end;
  final bool bottom;
  final bool maintainBottomViewPadding;
  final EdgeInsetsGeometry minimum;
  final Widget child;

  const DirectionalSafeArea({
    super.key,
    this.start = true,
    this.top = true,
    this.end = true,
    this.bottom = true,
    this.maintainBottomViewPadding = false,
    this.minimum = EdgeInsets.zero,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    assert(debugCheckHasDirectionality(context));
    final TextDirection textDirection = Directionality.of(context);
    final EdgeInsets effectiveMinimum = minimum.resolve(textDirection);

    return SafeArea(
      top: top,
      bottom: bottom,
      left: textDirection == TextDirection.ltr ? start : end,
      right: textDirection == TextDirection.rtl ? start : end,
      maintainBottomViewPadding: maintainBottomViewPadding,
      minimum: effectiveMinimum,
      child: child,
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(FlagProperty('start', value: start, ifTrue: 'avoid start padding'));
    properties.add(FlagProperty('top', value: top, ifTrue: 'avoid top padding'));
    properties.add(FlagProperty('end', value: end, ifTrue: 'avoid end padding'));
    properties.add(FlagProperty('bottom', value: bottom, ifTrue: 'avoid bottom padding'));
  }
}
