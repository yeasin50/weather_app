import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SavedCityAppBar extends StatelessWidget {
  const SavedCityAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      child: InkWell(
        onTap: context.pop,
        child: const Row(
          children: [
            Icon(Icons.arrow_back_ios_new_rounded),
            SizedBox(width: 48),
            Expanded(
              child: Text("Weather"),
            ),
          ],
        ),
      ),
    );
  }
}
