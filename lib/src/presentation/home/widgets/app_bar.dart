import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../app/route_config.dart';
import '/src/presentation/saved_city/saved_city_page.dart';
import '../../widgets/gradient_background.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return SafeArea(
      child: Padding(
        padding: const .symmetric(horizontal: 12.0, vertical: 4),
        child: IntrinsicHeight(
          child: Row(
            spacing: 24,
            children: [
              IconButton(onPressed: () {}, icon: Icon(Icons.menu)),
              Expanded(
                child: InkWell(
                  onTap: () {},
                  child: SizedBox(
                    height: 40,
                    child: Center(
                      child: Text(
                        title,
                        style: textTheme.titleLarge,
                        textAlign: .center,
                      ),
                    ),
                  ),
                ),
              ),
              IconButton(
                onPressed: () => context.push(AppRoute.searchCity),
                icon: Icon(Icons.search_rounded),
              ),
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
