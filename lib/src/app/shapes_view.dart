import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const ShapesView());
}

class ShapesView extends StatefulWidget {
  const ShapesView({super.key});

  @override
  State<ShapesView> createState() => _ShapesViewState();
}

class _ShapesViewState extends State<ShapesView> {
  double a = 0;
  double b = 0;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            spacing: 24,
            children: [
              Slider(
                value: a,
                min: 0,
                max: 360,
                label: a.toStringAsFixed(2),
                // divisions: 20,
                showValueIndicator: ShowValueIndicator.alwaysVisible,
                onChanged: (v) {
                  a = v;
                  setState(() {});
                },
              ),
              Slider(
                value: b,
                label: b.toStringAsFixed(2),
                showValueIndicator: ShowValueIndicator.alwaysVisible,
                onChanged: (v) {
                  b = v;
                  setState(() {});
                },
              ),
              // const MessurementView(),

              ///
            ],
          ),
        ),
      ),
    );
  }
}

/// ...
