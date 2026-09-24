import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../app/route_config.dart';
import '../common/widgets/app_button.dart';

class EmptyCityView extends StatelessWidget {
  const EmptyCityView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Align(
        alignment: Alignment(0, .15),
        child: Padding(
          padding: const .all(24),
          child: Column(
            mainAxisSize: .min,
            spacing: 32,
            children: [
              // ... settings , new location , current location
              AppButton(
                label: "use currenty location",
                onTap: () {},
                leading: Icon(Icons.location_on_outlined),
              ),

              AppButton.child(
                onTap: () {
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
      ),
    );
  }
}
