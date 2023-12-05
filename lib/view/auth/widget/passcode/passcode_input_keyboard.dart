part of 'passcode.dart';

class PasscodeInputKeyboard extends StatelessWidget {
  final ValueSetter<String> onNumberTap;
  final VoidCallback onBackspaceTap;
  final Color? backgroundColor;

  const PasscodeInputKeyboard({
    Key? key,
    required this.onNumberTap,
    required this.onBackspaceTap,
    this.backgroundColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: SizedBox(
        width: 280,
        child: MediaQuery(
          data: context.mediaQuery.copyWith(textScaleFactor: 1),
          child: LayoutBuilder(builder: (context, constraints) {
            const padding = 16.0;
            const spacing = 12.0;
            final itemSize = math.min(84.0, (constraints.maxHeight - (spacing * 3) - (padding * 2)) / 4);

            return Directionality(
              textDirection: TextDirection.ltr,
              child: GridView(
                shrinkWrap: true,
                clipBehavior: Clip.hardEdge,
                physics: const NeverScrollableScrollPhysics(),
                padding: const EdgeInsets.all(padding),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: 1,
                  mainAxisExtent: itemSize,
                  crossAxisSpacing: spacing,
                  mainAxisSpacing: spacing,
                ),
                children: [
                  ...["1", "2", "3", "4", "5", "6", "7", "8", "9"].map<Widget>(
                    (element) => _PasscodeKeyboardButton(
                      onPressed: () => onNumberTap(element),
                      backgroundColor: backgroundColor ?? context.colorScheme.onSurfaceVariant,
                      child: Text(
                        element,
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium
                            ?.copyWith(fontSize: 32, color: context.colorScheme.onPrimaryContainer),
                      ),
                    ),
                  ),
                  const SizedBox.shrink(),
                  _PasscodeKeyboardButton(
                    onPressed: () => onNumberTap("0"),
                    backgroundColor: backgroundColor ?? context.colorScheme.onSurfaceVariant,
                    child: Text(
                      "0",
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium
                          ?.copyWith(fontSize: 32, color: context.colorScheme.onPrimaryContainer),
                    ),
                  ),
                  _PasscodeKeyboardButton(
                    onPressed: onBackspaceTap,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: backgroundColor ?? context.colorScheme.onSurfaceVariant,
                      elevation: 0,
                      shape: const CircleBorder(),
                    ),
                    child: Icon(
                      Icons.backspace,
                      color: context.colorScheme.onPrimaryContainer,
                    ),
                  ),
                ],
              ),
            );
          }),
        ),
      ),
    );
  }
}

class _PasscodeKeyboardButton extends StatelessWidget {
  final Widget child;
  final VoidCallback? onPressed;
  final Color? backgroundColor;
  final ButtonStyle? style;

  const _PasscodeKeyboardButton({
    Key? key,
    required this.child,
    required this.onPressed,
    this.backgroundColor,
    this.style,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => onPressed?.call(),
      style: style ??
          ElevatedButton.styleFrom(
            splashFactory: InkSplash.splashFactory,
            elevation: 0,
            foregroundColor: context.colorScheme.onSecondary,
            backgroundColor: backgroundColor,
            shadowColor: context.colorScheme.background,
            shape: const CircleBorder(),
          ),
      child: child,
    );
  }
}
