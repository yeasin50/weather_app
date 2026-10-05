import 'package:flutter/material.dart';

import 'setting_tile.dart';

class SettingsGroup extends StatelessWidget {
  const SettingsGroup({super.key, required this.title, required this.items});

  final String title;
  final List<SettingTile> items;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Column(
        spacing: 12,
        crossAxisAlignment: .stretch,
        children: [
          Padding(padding: .symmetric(horizontal: 12.0), child: Text(title)),
          Material(
            borderRadius: .circular(24),
            clipBehavior: .antiAlias,
            color: Colors.transparent,
            child: Column(
              crossAxisAlignment: .stretch,
              children: items
                  .map((e) => Padding(padding: .only(bottom: 2), child: e))
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }
}
