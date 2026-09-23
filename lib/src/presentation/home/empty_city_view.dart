import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../app/route_config.dart';
import '../common/widgets/app_button.dart';

class EmptyCityView extends StatelessWidget {
  const EmptyCityView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Align(
        alignment: Alignment(0, .15),
        child: Column(
          mainAxisSize: .min,
          spacing: 32,
          children: [
            // ... settings , new location , current location
            AppButton(label: "use currenty location"),

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

            // AppButton.child(child: const Center(child: Text("unit"))),
          ],
        ),
      ),
    );
  }
}
