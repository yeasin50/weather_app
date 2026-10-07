import 'package:flutter/material.dart';

import 'common.dart';

/// common place to show bottomSheets on home weather cards
class ChartDialogView extends StatelessWidget {
  const ChartDialogView._({
    required this.title,
    required this.chartView,
    this.onTap,
  });

  final String title;
  final VoidCallback? onTap;
  final Widget chartView;

  static void show({
    required BuildContext context,
    required String title,
    VoidCallback? onTap,
    required Widget chartView,
  }) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      showDragHandle: true,
      builder: (context) =>
          ChartDialogView._(title: title, chartView: chartView, onTap: onTap),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const .symmetric(horizontal: 16, vertical: 12),
        child: Column(
          mainAxisSize: .min,
          spacing: 24,
          children: [
            DialogTitle(title: title, onTap: onTap),
            chartView,
          ],
        ),
      ),
    );
  }
}
