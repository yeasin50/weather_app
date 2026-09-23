import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '/src/presentation/saved_city/saved_city_page.dart';
import '../../widgets/gradient_background.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({super.key, required this.title});

  final String title;

  @override
  Size get preferredSize => Size.fromHeight(56 + 12);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Material(
      color: Theme.of(context).colorScheme.surfaceContainerLowest,
      shape: StadiumBorder(),
      child: InkWell(
        onTap: () {},
        customBorder: StadiumBorder(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8),
          child: Row(
            mainAxisAlignment: .center,
            spacing: 24,
            children: [
              Expanded(
                child: Row(
                  spacing: 4,
                  children: [
                    const Icon(Icons.location_pin),
                    Text(title, style: textTheme.titleLarge),
                  ],
                ),
              ),
              IconButton(onPressed: () {}, icon: Icon(Icons.settings)),
            ],
          ),
        ),
      ),
    );
  }
}

@deprecated
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

                  Placeholder(
                    fallbackHeight: 120,
                    child: Text("Your current location"),
                  ),
                  Expanded(child: SavedCityPage.view()),
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
