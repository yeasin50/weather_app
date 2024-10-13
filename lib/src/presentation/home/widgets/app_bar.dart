import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:weather_app/src/app/theme_config.dart';
import '../../../app/route_config.dart';
import '../../common/widgets/glassmorphism.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Glassmorphism(
      borderRadius: BorderRadius.zero,
      child: Row(
        children: [
          const SizedBox(width: 24),
          Expanded(
            child: InkWell(
              customBorder: const StadiumBorder(
                side: BorderSide(),
              ),
              onTap: () {
                context.push(AppRoute.searchCity);
              },
              child: Material(
                color: AppTheme.appBarBG,
                shape: const StadiumBorder(side: BorderSide()),
                child: SizedBox(
                  height: kToolbarHeight,
                  child: Row(
                    children: [
                      const SizedBox(width: 24),
                      const Icon(Icons.location_pin),
                      const SizedBox(width: 24),
                      Expanded(
                        child: StreamBuilder<Object>(
                          stream: null,
                          builder: (context, snapshot) {
                            return Text(title, style: textTheme.titleLarge);
                          }
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          IconButton(
            onPressed: () {
              context.push(AppRoute.savedPage);
            },
            icon: const Icon(Icons.person_3_rounded),
          ),
          const SizedBox(width: 24),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
