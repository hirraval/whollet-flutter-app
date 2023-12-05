import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:whollet_extensions/whollet_extensions.dart';
import 'package:whollet_flutter_app/components/app_image.dart';

class AppHeader extends StatelessWidget {
  final String backgroundVector;
  final String title;
  final Widget body;

  const AppHeader({
    super.key,
    required this.backgroundVector,
    required this.title,
    required this.body,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = context.colorScheme;
    final textTheme = context.theme.textTheme;
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarBrightness: Brightness.dark,
        statusBarIconBrightness: Brightness.dark,
        statusBarColor: colorScheme.secondary,
        systemNavigationBarColor: colorScheme.onSecondary,
      ),
      child: Scaffold(
        backgroundColor: colorScheme.secondary,
        body: Stack(
          children: [
            CustomScrollView(
              physics: const ClampingScrollPhysics(),
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
              slivers: [
                SliverAppBar(
                  backgroundColor: colorScheme.secondary,
                  automaticallyImplyLeading: false,
                  pinned: true,
                  flexibleSpace: FlexibleSpaceBar(
                    background: Padding(
                      padding: EdgeInsetsDirectional.only(top: context.topPadding + 24),
                      child: SvgImageFromAsset(backgroundVector),
                    ),
                  ),
                  title: Text(title, style: textTheme.bodyLarge?.copyWith(fontSize: 26)),
                  centerTitle: true,
                  expandedHeight: context.height / 2.5,
                  collapsedHeight: 60,
                ),
                SliverList(
                  delegate: SliverChildListDelegate(
                    [
                      body,
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
