import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../app/route_config.dart';
import 'widgets/setting_tile.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar.large(
            title: Text("Settings"),
            actions: [],
            leading: BackButton(onPressed: context.pop),
          ),

          SliverToBoxAdapter(
            child: SettingTile(
              title: "Appearece",
              description: "Language, unit, theme, icons",
              leading: Icon(Icons.palette_outlined),
              onTap: () {
                context.go(AppRoute.appearance);
              },
            ),
          ),
        ],
      ),
    );
  }
}
