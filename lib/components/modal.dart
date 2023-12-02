import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:whollet_extensions/whollet_extensions.dart';
import 'package:whollet_flutter_app/resources/resources.dart';

import 'app_buttons.dart';
import 'direction_safe_area.dart';

Future<T?> showAppModal<T extends Object?>({
  required BuildContext context,
  required WidgetBuilder builder,
  RouteSettings? settings,
}) async {
  return showGeneralDialog<T>(
    context: context,
    useRootNavigator: false,
    barrierDismissible: true,
    barrierLabel: 'app_modal',
    barrierColor: Colors.black12,
    routeSettings: settings,
    pageBuilder: (context, animation, secondaryAnimation) => AppModal(
      child: Builder(builder: builder),
    ),
    transitionBuilder: (context, animation, secondaryAnimation, child) {
      if (context.width > LayoutConstraints.modalDialog.width) {
        return ModalTransition(animation: animation, child: child);
      }
      return SlideTransition(
        position: Tween(begin: const Offset(0, 1), end: Offset.zero).animate(animation),
        child: child,
      );
    },
    anchorPoint: const Offset(600, 0),
  );
}

Future<T?> showAppModalDialog<T extends Object?>({
  required BuildContext context,
  required WidgetBuilder builder,
  bool fullScreenDialog = false,
  RouteSettings? settings,
}) async {
  return showGeneralDialog<T>(
    context: context,
    useRootNavigator: false,
    barrierDismissible: true,
    routeSettings: settings,
    barrierColor: Colors.black12,
    anchorPoint: const Offset(600, 0),
    barrierLabel: 'app_modal_dialog',
    pageBuilder: (context, animation, secondaryAnimation) => AppModalDialog(
      fullScreenDialog: fullScreenDialog,
      child: Builder(builder: builder),
    ),
    transitionBuilder: (context, animation, secondaryAnimation, child) => ModalTransition(
      animation: animation,
      child: child,
    ),
  );
}

class ModalTransition extends StatelessWidget {
  final Alignment alignment;
  final Animation<double> animation;
  final Widget child;

  const ModalTransition({
    super.key,
    required this.animation,
    required this.child,
    this.alignment = Alignment.center,
  });

  @override
  Widget build(BuildContext context) {
    final animationTween = Tween(begin: 0.8, end: 1.0).animate(animation);
    return ScaleTransition(
      alignment: alignment,
      scale: animationTween,
      child: FadeTransition(
        opacity: animationTween,
        child: child,
      ),
    );
  }
}

class AppModal extends StatelessWidget {
  final Widget child;

  const AppModal({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    final bool isModalDialog = context.width > LayoutConstraints.modalDialog.width;
    final effectivePadding = calculateSafeAreaPadding(
      context: context,
      minimum: const EdgeInsets.all(Spacing.xLarge),
    );
    final effectiveBorderRadius = BorderRadius.vertical(
      top: ShapeRadius.normal,
      bottom: isModalDialog ? ShapeRadius.normal : ShapeRadius.zero,
    );

    return Align(
      alignment: isModalDialog ? Alignment.center : Alignment.bottomCenter,
      child: Card(
        margin: isModalDialog
            ? (effectivePadding + context.mediaQueryInsets)
            : EdgeInsets.only(top: effectivePadding.top + 16),
        shape: RoundedRectangleBorder(borderRadius: effectiveBorderRadius),
        child: Builder(
          builder: (context) {
            final mediaQuery = context.mediaQuery;
            return MediaQuery(
              data: mediaQuery.copyWith(
                viewInsets: isModalDialog ? EdgeInsets.zero : mediaQuery.viewInsets,
                padding: isModalDialog ? EdgeInsets.zero : mediaQuery.padding.copyWith(top: 0),
              ),
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  maxWidth: LayoutConstraints.modalDialog.width,
                  maxHeight: isModalDialog ? LayoutConstraints.modalDialog.height : double.maxFinite,
                ),
                child: child,
              ),
            );
          },
        ),
      ),
    );
  }
}

class AppModalDialog extends StatelessWidget {
  final bool fullScreenDialog;
  final Widget child;

  const AppModalDialog({
    super.key,
    required this.child,
    required this.fullScreenDialog,
  });

  @override
  Widget build(BuildContext context) {
    if (fullScreenDialog && context.width <= LayoutConstraints.modalDialog.width) {
      return Card(
        shape: const RoundedRectangleBorder(),
        child: child,
      );
    }

    return Padding(
      padding: context.mediaQueryInsets,
      child: MediaQuery.removeViewInsets(
        context: context,
        removeTop: true,
        removeRight: true,
        removeLeft: true,
        removeBottom: true,
        child: SafeArea(
          minimum: const EdgeInsets.all(Spacing.xLarge),
          child: Align(
            alignment: Alignment.center,
            child: Card(
              shape: const RoundedRectangleBorder(borderRadius: ShapeBorderRadius.normal),
              child: ConstrainedBox(
                constraints: BoxConstraints.loose(LayoutConstraints.modalDialog),
                child: child,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

typedef ModalButton = ({String label, VoidCallback? onPressed});

class ErrorModal extends StatelessWidget {
  final String title;
  final String content;
  final ModalButton button;

  const ErrorModal({
    super.key,
    required this.title,
    required this.content,
    required this.button,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = context.theme.textTheme;
    return SafeArea(
      minimum: const EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(title, style: textTheme.titleLarge),
          const Gap(Spacing.normal),
          Flexible(
            child: Scrollbar(
              child: SingleChildScrollView(
                child: Text(
                  content,
                  style: textTheme.labelSmall,
                  textAlign: TextAlign.start,
                ),
              ),
            ),
          ),
          const Gap(Spacing.normal),
          ErrorButton(
            onPressed: button.onPressed ?? () => context.navigator.removeRoute(ModalRoute.of(context)!),
            label: button.label,
          ),
        ],
      ),
    );
  }
}
