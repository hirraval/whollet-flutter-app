import 'package:flutter/material.dart';
import 'package:whollet_extensions/whollet_extensions.dart';
import 'package:whollet_flutter_app/resources/resources.dart';
import 'package:whollet_flutter_app/src/l10n/l10n.dart';

abstract class _Button extends StatelessWidget {
  final VoidCallback? onPressed;
  final String label;
  final bool dense;

  const _Button({
    super.key,
    required this.onPressed,
    required this.label,
    this.dense = false,
  });
}

class PrimaryButton extends _Button {
  const PrimaryButton({
    super.key,
    super.dense,
    required super.onPressed,
    required super.label,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return _ElevatedButton(
      label: label,
      onPressed: onPressed,
      dense: dense,
      backgroundColor: colorScheme.primary,
      foregroundColor: colorScheme.onPrimary,
    );
  }
}

class SecondaryButton extends _Button {
  const SecondaryButton({
    super.key,
    super.dense,
    required super.onPressed,
    required super.label,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return _ElevatedButton(
      label: label,
      onPressed: onPressed,
      dense: dense,
      backgroundColor: colorScheme.onSecondary,
      foregroundColor: colorScheme.primary,
    );
  }
}

class TertiaryButton extends _Button {
  const TertiaryButton({
    super.key,
    super.dense,
    required super.onPressed,
    required super.label,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return _ElevatedButton(
      label: label,
      onPressed: onPressed,
      dense: dense,
      backgroundColor: colorScheme.tertiary,
      foregroundColor: colorScheme.onTertiary,
    );
  }
}

class SuccessButton extends _Button {
  const SuccessButton({
    super.key,
    super.dense,
    required super.onPressed,
    required super.label,
  });

  @override
  Widget build(BuildContext context) {
    final appColor = context.appColor;
    return _ElevatedButton(
      label: label,
      onPressed: onPressed,
      dense: dense,
      backgroundColor: appColor.success,
      foregroundColor: appColor.onSuccess,
    );
  }
}

class ErrorButton extends _Button {
  const ErrorButton({
    super.key,
    super.dense,
    required super.onPressed,
    required super.label,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return _ElevatedButton(
      label: label,
      onPressed: onPressed,
      dense: dense,
      backgroundColor: colorScheme.error,
      foregroundColor: colorScheme.onError,
    );
  }
}

class _ElevatedButton extends _Button {
  final Color? backgroundColor;
  final Color? foregroundColor;

  const _ElevatedButton({
    super.dense,
    required super.onPressed,
    required super.label,
    this.backgroundColor,
    this.foregroundColor,
  });

  @override
  Widget build(BuildContext context) {
    final visualDensity = dense ? VisualDensity.compact : null;
    final shape = dense ? const RoundedRectangleBorder(borderRadius: ShapeBorderRadius.xLarge) : null;

    Widget child = Text(label, textAlign: TextAlign.center);
    if (!dense) child = Center(child: child);

    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        foregroundColor: foregroundColor,
        visualDensity: visualDensity,
        shape: shape,
      ),
      onPressed: onPressed,
      child: child,
    );
  }
}

class CancelButton extends StatelessWidget {
  final VoidCallback onPressed;

  const CancelButton({
    super.key,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final l10n = context.l10n;
    return TextButton(
      style: TextButton.styleFrom(
        foregroundColor: colorScheme.error,
      ),
      onPressed: onPressed,
      child: Text(l10n.cancelButtonLabel),
    );
  }
}

class SaveButton extends StatelessWidget {
  final VoidCallback onPressed;

  const SaveButton({
    super.key,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SecondaryButton(
      onPressed: onPressed,
      label: context.l10n.saveButtonLabel,
    );
  }
}

class BackIconButton extends StatelessWidget {
  final VoidCallback? onPressed;

  const BackIconButton({
    super.key,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = context.colorScheme;
    const borderRadius = ShapeBorderRadius.small;
    const padding = 8.0;
    const size = Size.square(padding * 2 + 24);

    return IconButton(
      onPressed: onPressed ?? () => context.navigator.maybePop(),
      style: IconButton.styleFrom(
        backgroundColor: colorScheme.surfaceVariant,
        foregroundColor: colorScheme.onSurfaceVariant,
        padding: const EdgeInsets.all(padding),
        shape: const RoundedRectangleBorder(borderRadius: borderRadius),
      ),
      constraints: BoxConstraints.tight(size),
      icon: const Icon(Icons.arrow_back_ios_new_rounded),
    );
  }
}

class LeadingBackButton extends StatelessWidget {
  final Color? color;
  final VoidCallback? onPressed;
  final String? label;

  const LeadingBackButton({
    super.key,
    this.onPressed,
    this.label,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed ?? context.navigator.canPop,
      icon: const Icon(Icons.arrow_back_ios,size: 22),
    );
  }
}

class DeleteIconButton extends StatelessWidget {
  final VoidCallback onPressed;

  const DeleteIconButton({
    super.key,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = context.colorScheme;
    return IconButton(
      onPressed: onPressed,
      constraints: const BoxConstraints.tightFor(width: 48, height: 48),
      icon: CircleAvatar(
        backgroundColor: colorScheme.error,
        foregroundColor: colorScheme.onError,
        child: const Icon(Icons.close),
      ),
    );
  }
}

class AddIconButton extends _IconButton {
  const AddIconButton({
    super.key,
    required super.onPressed,
  }) : super(dense: true);

  @override
  Widget buildIcon(BuildContext context) {
    return const Icon(Icons.add_rounded);
  }
}

abstract class _IconButton extends StatelessWidget {
  final VoidCallback onPressed;
  final bool dense;

  const _IconButton({
    super.key,
    required this.onPressed,
    this.dense = false,
  });

  Widget buildIcon(BuildContext context);

  @override
  Widget build(BuildContext context) {
    final colorScheme = context.colorScheme;
    final borderRadius = dense ? ShapeBorderRadius.small : ShapeBorderRadius.medium;
    final padding = dense ? 8.0 : 12.0;
    final size = Size.square(padding * 2 + 24);

    return IconButton(
      onPressed: onPressed,
      style: IconButton.styleFrom(
        backgroundColor: colorScheme.surfaceVariant,
        foregroundColor: colorScheme.onSurfaceVariant,
        padding: EdgeInsets.all(padding),
        shape: RoundedRectangleBorder(borderRadius: borderRadius),
      ),
      constraints: BoxConstraints.tight(size),
      icon: Builder(builder: buildIcon),
    );
  }
}
