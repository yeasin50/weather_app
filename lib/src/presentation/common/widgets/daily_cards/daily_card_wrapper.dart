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

class DailyWeatherCard extends StatelessWidget {
  const DailyWeatherCard({
    super.key,
    required this.title,
    required this.icon,
    required this.value,
    required this.unit,
    required this.description,
    this.onTap,
    this.shape = const CircleBorder(),
    this.progressValue,
  });

  final String title;
  final Widget icon;
  final String value;
  final String unit;
  final String description;

  final VoidCallback? onTap;
  final ShapeBorder shape;

  /// if not null  shows progressBar.
  /// - when `shape`  is circular , it is around it(specially top level with bottom cut)
  /// - when RoundedRectangleBorder then LinearProgressIndicator before description
  final double? progressValue;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final style = TextTheme.of(context);

    assert(shape is CircleBorder);

    return DailyItemCard(
      onTap: onTap,
      border: shape,
      child: Padding(
        ///TODO: Progress indicator
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: .spaceBetween,
          crossAxisAlignment: shape is CircleBorder ? .center : .stretch,
          children: [
            Row(
              mainAxisSize: .min,
              spacing: 4,
              children: [
                icon,
                Text(title, style: style.titleMedium),
              ],
            ),
            Row(
              mainAxisSize: .min,
              crossAxisAlignment: .end,
              children: [
                Text(value, style: style.displayLarge),
                Text(unit, style: style.displaySmall),
              ],
            ),

            Text(description),
          ],
        ),
      ),
    );
  }
}
