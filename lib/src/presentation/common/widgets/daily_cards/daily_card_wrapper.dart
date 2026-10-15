import 'package:flutter/material.dart';

/// a wrapper for daily gridItem to have persistent view
/// default shape is RoundedRectangleBorder with 24 circularborder
class DailyItemCard extends StatelessWidget {
  const DailyItemCard({
    super.key,
    this.border,
    this.onTap,
    required this.child,
  });

  final Widget child;

  ///
  final ShapeBorder? border;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;

    return AspectRatio(
      aspectRatio: 1,
      child: Material(
        color: scheme.surfaceContainer,
        shape: border ?? RoundedRectangleBorder(borderRadius: .circular(24)),
        type: .button,
        child: InkWell(
          onTap: onTap,
          customBorder:
              border ?? RoundedRectangleBorder(borderRadius: .circular(24)),
          // overlayColor: WidgetStateProperty.resolveWith((state) {
          //   // state.contains(WidgetState.hovered)
          //   return scheme.surfaceContainer;
          // }),
          child: Padding(padding: const .all(16.0), child: child),
        ),
      ),
    );
  }
}
