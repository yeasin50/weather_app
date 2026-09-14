import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:weather_app/src/presentation/saved_city/saved_city_page.dart';
import '../../../app/route_config.dart';
import '../../common/widgets/app_button.dart';
import '../../widgets/gradient_background.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return AppButton.child(
      onTap: () => Scaffold.of(context).openDrawer(),
      child: Row(
        spacing: 8,
        children: [
          const Icon(Icons.menu),
          Expanded(child: Text(title, style: textTheme.titleLarge)),
        ],
      ),
    );
  }
}

class AppDrawer extends StatefulWidget {
  const AppDrawer({super.key});

  @override
  State<AppDrawer> createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  @override
  Widget build(BuildContext context) {
    final textStyle = TextTheme.of(context);
    return LayoutBuilder(
      builder: (context, constraints) {
        return ConstrainedBox(
          constraints: BoxConstraints.tight(
            Size.fromWidth(constraints.maxWidth * .85),
          ),
          child: GradientBackground(
            isImage: false,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                spacing: 16,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    spacing: 16,
                    children: [
                      BackButton(onPressed: Scaffold.of(context).closeDrawer),
                      Text("location", style: textStyle.titleMedium),
                    ],
                  ),
                  Expanded(child: SavedCityPage.view()),
                  AppButton.child(
                    onTap: () {
                      Scaffold.of(context).closeDrawer();
                      context.push(AppRoute.searchCity);
                    },
                    child: Row(
                      spacing: 8,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.search),
                        const Text("Search location"),
                      ],
                    ),
                  ),

                  AppButton.child(child: const Center(child: Text("unit"))),
                  const SizedBox(),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
