part of 'passcode.dart';

class PasscodeView extends StatefulWidget {
  final PasscodeController controller;
  final int length;

  const PasscodeView({Key? key, required this.controller, required this.length}) : super(key: key);

  @override
  State<PasscodeView> createState() => _PasscodeViewState();
}

class _PasscodeViewState extends State<PasscodeView> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  String get passcode => widget.controller.passcode;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: const Duration(milliseconds: 300));
    _animation = Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
      parent: _controller,
      curve: const SineCurve(count: 4),
    ));
  }

  @override
  void didChangeDependencies() {
    widget.controller._state = this;
    super.didChangeDependencies();
  }

  @override
  void didUpdateWidget(covariant PasscodeView oldWidget) {
    widget.controller._state = this;
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    widget.controller._state = null;
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: Listenable.merge([_animation, widget.controller]),
      builder: (context, _) {
        return Transform.translate(
          offset: Offset(_animation.value * 16, 0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  widget.length,
                  (index) => AnimatedContainer(
                    duration: const Duration(milliseconds: 100),
                    height: 16,
                    width: 16,
                    alignment: Alignment.center,
                    margin: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: passcode.length > index ? context.appColor.success : context.colorScheme.onSecondaryContainer),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class SineCurve extends Curve {
  const SineCurve({this.count = 3});

  final double count;

  @override
  double transformInternal(double t) => math.sin(count * 2 * math.pi * t);
}

class PasscodeController extends ChangeNotifier {
  _PasscodeViewState? _state;
  String _passcode = "";
  bool _hasError = false;

  String get passcode => _passcode;

  set passcode(String value) {
    assert(_state != null);
    _passcode = value;
    notifyListeners();
  }

  bool get hasError => _hasError;

  set hasError(bool value) {
    _hasError = value;
    notifyListeners();
  }

  void invalidPasscode() {
    assert(_state != null);
    _hasError = true;
    Timer.run(() {
      HapticFeedback.heavyImpact();
      _state!._controller.forward().whenComplete(() {
        _state!._controller.reset();
        _passcode = "";
        _hasError = false;
        notifyListeners();
      });
    });
  }
}
