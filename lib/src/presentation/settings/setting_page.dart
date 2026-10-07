import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import '../../app/route_config.dart';
import '../provider/providers.dart';
import 'widgets/setting_tile.dart';
import 'widgets/settings_group.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<SettingProvider>(
        builder: (context, value, child) {
          final pref = value.preference;
          return CustomScrollView(
            slivers: [
              SliverAppBar.large(
                title: Text("Settings"),
                actions: [],
                leading: BackButton(onPressed: context.pop),
              ),

              SliverPadding(
                padding: const .symmetric(horizontal: 12.0),
                sliver: SliverList.list(
                  children: [
                    SettingTile(
                      title: "Appearece",
                      description: "Language, unit, theme, icons",
                      leading: Icon(Icons.palette_outlined),
                      enableBorder: true,
                      onTap: () {
                        context.push(AppRoute.appearance);
                      },
                    ),

                    SizedBox(height: 32),

                    SettingTile(
                      enableBorder: true,
                      title: "timezone",
                      description: "todo", // pref.timezone,
                      onTap: () {},
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
