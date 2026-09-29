import 'package:flutter/material.dart';

import 'circular_progress_painter.dart';
import 'daily_card_wrapper.dart';
import 'uvindex_view.dart';
import 'wind_shape_painter.dart';

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
    this.painter,
  });

  final String title;
  final Widget icon;
  final String value;
  final String unit;
  final String description;

  final VoidCallback? onTap;
  final ShapeBorder shape;
  final CustomPainter? painter;

  /// if not null  shows progressBar.
  /// - when `shape`  is circular , it is around it(specially top level with bottom cut)
  /// - when RoundedRectangleBorder then LinearProgressIndicator before description
  final double? progressValue;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final style = TextTheme.of(context);

    assert(
      shape is CircleBorder ||
          shape is UVIndexShape ||
          shape is RoundedRectangleBorder,
    );

    return DailyItemCard(
      onTap: onTap,
      border: shape,
      child: Stack(
        fit: .expand,
        children: [
          if (shape is CircleBorder)
            CustomPaint(
              painter:
                  painter ??
                  CircularProgressPainter(AlwaysStoppedAnimation(.2)),
            ),
          Padding(
            // TODO: Progress indicator
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisAlignment: .spaceBetween,
              crossAxisAlignment:
                  shape is CircleBorder ||
                      shape is UVIndexShape ||
                      painter is WindShapePainter
                  ? .center
                  : .stretch,
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
        ],
      ),
    );
  }
}
