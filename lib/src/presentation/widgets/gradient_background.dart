import 'package:flutter/material.dart';

class GradientBackground extends StatelessWidget {
  const GradientBackground({
    super.key,
    required this.child,
    required this.isImage,
  });

  final Widget child;
  final bool isImage;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        image: isImage == false
            ? null
            : DecorationImage(
                image: const NetworkImage(
                  "https://images.pexels.com/photos/2469122/pexels-photo-2469122.jpeg",
                ),
                colorFilter: ColorFilter.mode(
                  Colors.black.withAlpha(50),
                  BlendMode.saturation,
                ),
                fit: BoxFit.cover,
              ),
        gradient: isImage
            ? null
            : const LinearGradient(
                colors: [
                  Color(0xFF2E335A),
                  Color.fromARGB(255, 28, 27, 51),
                ],
                stops: [0, 1],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
      ),
      child: child,
    );
  }
}
