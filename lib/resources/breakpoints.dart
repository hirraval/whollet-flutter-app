import 'dart:math';

import 'package:flutter/material.dart';
import 'package:whollet_extensions/whollet_extensions.dart';

interface class LayoutConstraints {
  static const Size popUpMenu = Size(360, 640);
  static const Size modalDialog = Size(560, 640);
  static const BoxConstraints standardHubOptions = BoxConstraints(maxWidth: 400, maxHeight: 400);
  static const BoxConstraints desktopHubOptions = BoxConstraints(maxWidth: 360);

  static const BoxConstraints textField = BoxConstraints(maxWidth: 560);
  static const Size buttonSize = Size.fromWidth(560);
  static const double snackbar = 560;

  static const BoxConstraints authLayout = BoxConstraints(maxWidth: 560);
  static const BoxConstraints deviceDetail = BoxConstraints(maxWidth: 560);
  static const BoxConstraints deviceImage = BoxConstraints(maxWidth: 320);
  static const BoxConstraints forms = BoxConstraints(maxWidth: 560);
  static const BoxConstraints menuList = BoxConstraints(maxWidth: 560);
  static const BoxConstraints contactUsCard = BoxConstraints(maxWidth: 560);
  static const BoxConstraints topicContentArea = BoxConstraints(maxWidth: 1200);
  static const BoxConstraints searchField = BoxConstraints(maxWidth: 360);
  static const BoxConstraints trackingDetail = BoxConstraints(maxWidth: 640);

  static const double gridItemMaxCrossAxisExtend = 520;
  static const double drawerMinHeight = 540;
  static const double drawerWidth = 280;
  static const double gridItemSpacing = 16;
  static const double hubSelectionWidth = 400;

  static const BoxConstraints deviceItemImageConstraints = BoxConstraints.tightFor(width: 72);

  static SliverGridDelegate _getGridDelegate(BuildContext context, double size) {
    return SliverGridDelegateWithMaxCrossAxisExtent(
      maxCrossAxisExtent: gridItemMaxCrossAxisExtend,
      crossAxisSpacing: gridItemSpacing,
      mainAxisSpacing: gridItemSpacing,
      mainAxisExtent: max(size, size * context.textScaleFactor),
    );
  }

  static SliverGridDelegate getDevicesGridDelegate(BuildContext context) => _getGridDelegate(context, 96);

  static SliverGridDelegate getCamerasGridDelegate(BuildContext context) => _getGridDelegate(context, 280);

  static SliverGridDelegate getDoorbellsGridDelegate(BuildContext context) => _getGridDelegate(context, 84);

  static SliverGridDelegate getArmZoneGridDelegate(BuildContext context) => _getGridDelegate(context, 80);

  static SliverGridDelegate getArmZoneDevicesGridDelegate(BuildContext context) => _getGridDelegate(context, 56);
}

enum ScreenSize {
  small(320),
  normal(560),
  medium(960),
  large(1200),
  xLarge(1440),
  xxLarge(1600);

  final double maxWidth;

  const ScreenSize(this.maxWidth);

  factory ScreenSize.fromWidth(double width) {
    return switch (width) {
      _ when width <= small.maxWidth => small,
      _ when width <= normal.maxWidth => normal,
      _ when width <= medium.maxWidth => medium,
      _ when width <= large.maxWidth => large,
      _ when width <= xLarge.maxWidth => xLarge,
      _ => xxLarge,
    };
  }

  static ScreenSize of(BuildContext context) {
    final width = context.mediaQuery.size.width;
    return ScreenSize.fromWidth(width);
  }

  bool get isLarge => this >= ScreenSize.large;

  bool operator >(ScreenSize other) => maxWidth > other.maxWidth;

  bool operator <(ScreenSize other) => maxWidth < other.maxWidth;

  bool operator <=(ScreenSize other) => maxWidth <= other.maxWidth;

  bool operator >=(ScreenSize other) => maxWidth >= other.maxWidth;
}

typedef ScreenSizeWidgetBuilder = Widget Function(BuildContext context, ScreenSize size);

mixin ScreenSizeMixin<S extends StatefulWidget> on State<S> {
  late ScreenSize _screenSize = ScreenSize.of(context);

  ScreenSize get screenSize => _screenSize;

  bool get isLargeScreen => screenSize >= ScreenSize.large;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final currentSize = ScreenSize.of(context);
    if (currentSize != _screenSize) {
      _screenSize = currentSize;
      onScreenSizeChanged();
    }
  }

  void onScreenSizeChanged() {}
}
