import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:whollet_flutter_app/resources/size.dart';

class AlertMessage extends SnackBar {
  AlertMessage({
    super.key,
    required String title,
    required String? description,
    required Color? backgroundColor,
    required Color? foregroundColor,
    super.duration = const Duration(seconds: 3),
  }) : super(
          content: _AlertMessageContent(
            key: UniqueKey(),
            title: title,
            description: description,
            foregroundColor: foregroundColor,
            backgroundColor: backgroundColor,
          ),
          backgroundColor: Colors.white,
          margin: const EdgeInsets.fromLTRB(16, 16, 16, 8),
          padding: EdgeInsets.zero,
          clipBehavior: Clip.hardEdge,
          dismissDirection: DismissDirection.down,
          behavior: SnackBarBehavior.floating,
        );
}

class _AlertMessageContent extends StatelessWidget {
  final String title;
  final String? description;
  final Color? foregroundColor;
  final Color? backgroundColor;

  const _AlertMessageContent({
    super.key,
    required this.title,
    required this.description,
    required this.foregroundColor,
    required this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final snackBarTheme = theme.snackBarTheme;
    final foregroundColor = this.foregroundColor ?? snackBarTheme.contentTextStyle?.color ?? colorScheme.onBackground;

    return Material(
      shape: snackBarTheme.shape,
      color: backgroundColor,
      child: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(8, 8, 16, 8),
        child: IntrinsicHeight(
          child: Row(
            children: [
              Container(
                width: 4,
                decoration: BoxDecoration(color: foregroundColor, borderRadius: ShapeBorderRadius.small),
              ),
              const Gap(8),
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700, color: foregroundColor),
                    ),
                    if (description != null && description!.isNotEmpty)
                      Text(
                        description!,
                        style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500, color: foregroundColor),
                      ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
