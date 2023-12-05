import 'package:data/data.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:whollet_extensions/whollet_extensions.dart';
import 'package:whollet_flutter_app/app/dependency.dart';
import 'package:whollet_flutter_app/components/components.dart';
import 'package:whollet_flutter_app/resources/resources.dart';
import 'package:whollet_flutter_app/src/l10n/generated/l10n.dart';
import 'package:whollet_flutter_app/view/auth/welcome/welcome_view.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({super.key});

  static String get routeName => "/onboarding";

  static Widget builder(BuildContext context) => const OnBoardingView();

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  final _imageController = PageController();
  final _controller = PageController();
  late final _dependencyHelper = DependencyHelper.getInstance();
  late final _preference = _dependencyHelper<AppPreference>();

  @override
  void initState() {
    _controller.addListener(() => setState(() {}));
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    _imageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = context.colorScheme;
    final textTheme = context.theme.textTheme;
    final l10n = WholletLocalization.of(context);
    return Scaffold(
      body: Container(
        color: colorScheme.secondary,
        child: Stack(
          children: [
            PageView.builder(
              controller: _imageController,
              itemCount: _introList.length,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                final item = _introList[index];
                return Align(
                  alignment: Alignment.topCenter,
                  child: Padding(
                    padding: EdgeInsets.only(top: context.topPadding),
                    child: SvgImageFromAsset(item.image),
                  ),
                );
              },
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: context.width,
                height: context.height / 1.5,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24),
                  color: colorScheme.onPrimary,
                ),
                child: Column(
                  children: [
                    Expanded(
                      child: PageView.builder(
                        itemCount: _introList.length,
                        controller: _controller,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          final item = _introList[index];
                          return Padding(
                            padding: const EdgeInsets.all(24),
                            child: Column(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(top: context.topPadding),
                                  child: Text(
                                    item.title,
                                    style: textTheme.headlineLarge,
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                const Gap(12),
                                Text(
                                  item.description,
                                  style: textTheme.bodySmall?.copyWith(fontSize: 15),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                    SafeArea(
                        minimum: calculateSafeAreaPadding(
                          context: context,
                          minimum: EdgeInsetsDirectional.only(bottom: context.bottomPadding + 24),
                        ),
                        child: Builder(
                          builder: (context) {
                            if (_controller.pageIndex == 3) {
                              return PrimaryButton(
                                onPressed: () {
                                  _preference.hasSeenIntro = true;
                                  context.navigator.pushReplacementNamed(WelcomeView.routeName);
                                },
                                label: WholletLocalization.of(context).letsGetStartedButtonLabel,
                                dense: true,
                              );
                            }
                            return OutlinedButton(
                              onPressed: () async {
                                Future.wait([
                                  _controller.nextPage(
                                    duration: const Duration(milliseconds: 300),
                                    curve: Curves.linear,
                                  ),
                                  _imageController.nextPage(
                                    duration: const Duration(milliseconds: 300),
                                    curve: Curves.linear,
                                  ),
                                ]);
                              },
                              child: Text(
                                l10n.nextStepButtonLabel,
                                style: textTheme.titleLarge?.copyWith(color: colorScheme.primary, fontSize: 19),
                              ),
                            );
                          },
                        )),
                  ],
                ),
              ),
            ),
            if (_controller.pageIndex != _introList.length - 1)
              Positioned(
                right: 0,
                top: 20,
                child: TextButton(
                    onPressed: () {
                      _preference.hasSeenIntro = true;
                      context.navigator.pushReplacementNamed(WelcomeView.routeName);
                    },
                    child: Text(
                      l10n.skipButtonLabel,
                      style: textTheme.titleLarge?.copyWith(color: colorScheme.primary, fontSize: 19),
                    )),
              ),
            Positioned(
              top: 0,
              bottom: 230,
              right: 0,
              left: 150,
              child: ListenableBuilder(
                listenable: _controller,
                builder: (context, child) {
                  final pageIndex = _controller.pageIndex;
                  return Row(
                    children: List.generate(
                      _introList.length,
                      (index) => Container(
                        margin: const EdgeInsets.all(8),
                        height: 10,
                        width: 10,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: pageIndex == index ? colorScheme.primary : colorScheme.tertiary,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

final _introList = [
  (
    image: IntroImages.firstIntro,
    title: WholletLocalization.current.firstIntroTitle,
    description: WholletLocalization.current.firstIntroDescription,
  ),
  (
    image: IntroImages.secondIntro,
    title: WholletLocalization.current.secondIntroTitle,
    description: WholletLocalization.current.secondIntroDescription,
  ),
  (
    image: IntroImages.thirdIntro,
    title: WholletLocalization.current.thirdIntroTitle,
    description: WholletLocalization.current.thirdIntroDescription,
  ),
  (
    image: IntroImages.fourthIntro,
    title: WholletLocalization.current.fourthIntroTitle,
    description: WholletLocalization.current.fourthIntroDescription,
  )
];
