part of 'passcode.dart';

class PasscodeInputView extends StatefulWidget {
  final PasscodeInputController controller;
  final ValueSetter<String>? onDone;
  final Color? backgroundColor;
  final bool hasBiometricsOption;
  final VoidCallback? onBiometricsCheck;

  const PasscodeInputView({
    Key? key,
    required this.controller,
    this.onDone,
    this.backgroundColor,
    this.hasBiometricsOption = false,
    this.onBiometricsCheck,
  }) : super(key: key);

  @override
  State<PasscodeInputView> createState() => _PasscodeInputViewState();
}

class _PasscodeInputViewState extends State<PasscodeInputView> {
  @override
  void initState() {
    widget.controller._controller.addListener(_passcodeListener);

    super.initState();
  }

  @override
  void dispose() {
    widget.controller._controller.removeListener(_passcodeListener);
    super.dispose();
  }

  _passcodeListener() {
    if (widget.controller.passcode.length == widget.controller.length) {
      widget.onDone?.call(widget.controller.passcode);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Expanded(child: SizedBox()),
        Expanded(
          child: PasscodeView(
            controller: widget.controller._controller,
            length: widget.controller.length,
          ),
        ),
        Expanded(
          flex: 2,
          child: PasscodeInputKeyboard(
            onNumberTap: widget.controller._onNumberTap,
            onBackspaceTap: widget.controller._onBackspaceTap,
            backgroundColor: widget.backgroundColor,
          ),
        ),
        Gap(context.bottomPadding),
      ],
    );
  }
}

class PasscodeInputController extends ChangeNotifier {
  final PasscodeController _controller = PasscodeController();
  final int length;

  String get passcode => _controller.passcode;

  PasscodeInputController(this.length);

  void clear() {
    _controller.passcode = "";
  }

  void _onNumberTap(String value) {
    if (_controller.passcode.length < length) {
      _controller.passcode = _controller.passcode + value;
      notifyListeners();
    } else {
      _controller.passcode = _controller.passcode;
    }
    HapticFeedback.lightImpact();
  }

  void _onBackspaceTap() {
    if (_controller.passcode.isNotEmpty) {
      var length = _controller.passcode.length;
      _controller.passcode = _controller.passcode.substring(0, length - 1);
      notifyListeners();
    }
    HapticFeedback.lightImpact();
  }

  void invalidPasscode() {
    _controller.invalidPasscode();
  }
}
