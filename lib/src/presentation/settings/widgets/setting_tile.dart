import 'package:flutter/material.dart';

class SettingTile extends StatelessWidget {
  const SettingTile({
    super.key,
    required this.title,
    required this.description,
    this.leading,
    this.onTap,
  });

  final String title;
  final String description;

  final Widget? leading;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final style = TextTheme.of(context);

    return Material(
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            spacing: 12, // same as horizontal padding
            children: [
              ?leading,
              Expanded(
                child: Column(
                  crossAxisAlignment: .stretch,
                  spacing: 12,
                  children: [
                    Text(title, style: style.titleMedium),
                    Text(description, style: style.bodyMedium),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
