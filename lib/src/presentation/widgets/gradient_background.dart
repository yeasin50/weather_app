import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

// TODO: "remove color and use mood based bg")
@deprecated
class GradientBackground extends StatelessWidget {
  const GradientBackground({
    super.key,
    required this.child,
    this.isImage = false,
  });

  final Widget child;
  final bool isImage;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        // image: isImage == false
        //     ? null
        //     : DecorationImage(
        //         image: const CachedNetworkImageProvider(
        //           "https://images.pexels.com/photos/2469122/pexels-photo-2469122.jpeg",
        //         ),
        //         colorFilter: ColorFilter.mode(
        //           Colors.black.withAlpha(50),
        //           BlendMode.saturation,
        //         ),
        //         fit: BoxFit.cover,
        //       ),
        // gradient: isImage
        //     ? null
        //     : const LinearGradient(
        //         colors: [Color(0xFF2E335A), Color.fromARGB(255, 28, 27, 51)],
        //         stops: [0, 1],
        //         begin: Alignment.topLeft,
        //         end: Alignment.bottomRight,
        //       ),
      ),
      child: SafeArea(child: child),
    );
  }
}
