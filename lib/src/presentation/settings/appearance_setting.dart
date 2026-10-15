import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import '/src/domain/entity/user_preference.dart';

import '../provider/providers.dart';
import 'widgets/setting_tile.dart';
import 'widgets/settings_group.dart';

class AppearanceSetting extends StatefulWidget {
  const AppearanceSetting({super.key});

  @override
  State<AppearanceSetting> createState() => _AppearanceSettingState();
}

class _AppearanceSettingState extends State<AppearanceSetting> {
  @override
  Widget build(BuildContext context) {
    const groupSeparator = SizedBox(height: 32);

    return Scaffold(
      body: Consumer<SettingProvider>(
        builder: (context, value, child) {
          final pref = value.preference;
          return CustomScrollView(
            slivers: [
              SliverAppBar.large(title: Text("Appearance")),

              SliverList.list(
                children: [
                  // SettingsGroup(
                  //   title: ".....",
                  //   items: [
                  //     SettingTile(
                  //       title: "language",
                  //       description: pref.language,
                  //       onTap: () {},
                  //     ),
                  //   ],
                  // ),
                  groupSeparator,
                  SettingsGroup(
                    title: "theme",
                    items: [
                      SettingTile(
                        title: "theme_mode",
                        description: pref.theme,
                        onTap: () {},
                      ),
                      SettingTile(
                        title: "icon_pack",
                        description: pref.iconPack,
                        onTap: () {},
                      ),
                    ],
                  ),

                  groupSeparator,
                  _UnitsSettingsGroup(),

                  groupSeparator,
                  groupSeparator,
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}

class _UnitsSettingsGroup extends StatelessWidget {
  const _UnitsSettingsGroup({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<SettingProvider>(
      builder: (context, value, child) {
        final pref = value.preference;

        return SettingsGroup(
          title: "Units",
          items: [
            /// ...
            SettingTile(
              title: "temperature_unit",
              description: pref.tempUnit.name,
              onTap: () {
                _SettingPickerDialog.show(
                  context: context,
                  title: "temperature_unit",
                  items: TemperatureUnit.values,
                  selected: pref.tempUnit,
                );
              },
            ),
            SettingTile(
              title: "precipitation_unit",
              description: pref.preciptationUnit.name,
              onTap: () {
                _SettingPickerDialog.show(
                  context: context,
                  title: "precipitation_unit",
                  items: PrecipitationUnit.values,
                  selected: pref.preciptationUnit,
                );
              },
            ),

            SettingTile(
              title: "speed",
              description: pref.speedUnit.name,
              onTap: () {
                _SettingPickerDialog.show(
                  context: context,
                  title: "speed",
                  items: SpeedUnit.values,
                  selected: pref.speedUnit,
                );
              },
            ),

            SettingTile(
              title: "distance",
              description: pref.distanceUnit.name,
              onTap: () {
                _SettingPickerDialog.show(
                  context: context,
                  title: "distance",
                  items: DistanceUnit.values,
                  selected: pref.distanceUnit,
                );
              },
            ),
          ],
        );
      },
    );
  }
}

class _SettingPickerDialog<T> extends StatelessWidget {
  const _SettingPickerDialog._({
    required this.title,
    required this.items,
    required this.selectedItem,
  });

  final String title;
  final List<T> items;
  final T selectedItem;

  /// shows items and internally update it
  static Future<void> show<T>({
    required BuildContext context,
    required String title,
    required List<T> items,
    required T selected,
  }) async {
    await showDialog<T?>(
      context: context,
      builder: (context) => AlertDialog(
        content: _SettingPickerDialog._(
          title: title,
          items: items,
          selectedItem: selected,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final style = TextTheme.of(context);

    return RadioGroup<T>(
      groupValue: selectedItem,
      onChanged: (v) {
        if (v == null) return;
        context.read<SettingProvider>().update(v);
        context.pop();
      },
      child: Column(
        mainAxisSize: .min,
        crossAxisAlignment: .stretch,
        spacing: 8,
        children: [
          Text(title, style: style.titleLarge),
          for (final item in items)
            RadioListTile<T>(
              value: item,
              contentPadding: .zero,
              title: Text(item.toString().split(".").last),
            ),
        ],
      ),
    );
  }
}
