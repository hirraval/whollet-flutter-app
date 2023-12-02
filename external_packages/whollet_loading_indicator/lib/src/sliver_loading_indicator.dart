import 'package:flutter/material.dart';

import 'loading_indicator.dart';

class SliverFillLoadingIndicator extends StatelessWidget {
  const SliverFillLoadingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return const SliverFillRemaining(
      child: SafeArea(
        child: LoadingIndicator(),
      ),
    );
  }
}

class SliverLoadingIndicator extends StatelessWidget {
  const SliverLoadingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return const SliverToBoxAdapter(
      child: LoadingIndicator(),
    );
  }
}
