import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SavedCityAppBar extends StatelessWidget {
  const SavedCityAppBar({super.key,  });
 

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(children: [
          Transform.translate(
            offset: const Offset(-12, 0),
            child: IconButton(
                padding: EdgeInsets.zero, onPressed: context.pop, icon: const Icon(Icons.arrow_back_ios_new_rounded)),
          ),
          const Expanded(
            child: Text("Weather"),
          ),
          IconButton.outlined(
            onPressed: () {},
            padding: const EdgeInsets.all(2),
            icon: const Icon(Icons.more_horiz_rounded),
          )
        ]),
        
      ],
    );
  }
}
