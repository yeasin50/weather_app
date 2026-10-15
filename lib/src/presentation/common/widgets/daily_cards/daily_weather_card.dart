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

    final EdgeInsets bodyPadding = shape is RoundedRectangleBorder
        ? .all(4)
        : .all(16.0);

    final CrossAxisAlignment bodyCrossAxisAlignment =
        shape is CircleBorder ||
            shape is UVIndexShape ||
            painter is WindShapePainter
        ? .center
        : .stretch;

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
            padding: bodyPadding,
            child: Column(
              mainAxisAlignment: .spaceBetween,
              crossAxisAlignment: bodyCrossAxisAlignment,
              children: [
                Row(
                  mainAxisSize: .min,
                  spacing: 4,
                  children: [
                    icon,
                    Text(
                      title,
                      style: style.bodyMedium?.copyWith(fontWeight: .bold),
                    ),
                  ],
                ),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(text: value, style: style.displayMedium),
                      TextSpan(
                        text: unit,
                        style: style.bodyLarge?.copyWith(fontWeight: .w400),
                      ),
                    ],
                  ),
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
