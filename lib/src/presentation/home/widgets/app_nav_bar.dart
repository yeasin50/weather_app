import 'package:flutter/material.dart';
import 'package:weather_app/gen/assets.gen.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppNavBar extends StatelessWidget {
  const AppNavBar({
    super.key,
    required this.onTap,
  });

  final ValueChanged<int> onTap;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 85,
      child: DecoratedBox(
        decoration: ShapeDecoration(
          shape: BottomAppBarShape(),
        ),
        child: Align(
          alignment: Alignment.bottomCenter,
          child: BottomNavigationBar(
            onTap: onTap,
            elevation: 0,
            backgroundColor: Colors.transparent,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            items: [
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  Assets.icons.map,
                  colorFilter: const ColorFilter.mode(
                    Colors.white,
                    BlendMode.srcIn,
                  ),
                ),
                label: "",
              ),
              BottomNavigationBarItem(
                icon: Transform.scale(
                  scale: 2,
                  child: const Material(
                    color: Colors.white,
                    shape: CircleBorder(),
                    child: Icon(
                      Icons.add,
                      color: Colors.black,
                      size: 24,
                    ),
                  ),
                ),
                label: "",
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(Assets.icons.list),
                label: "",
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class BottomAppBarShape extends OutlinedBorder {
  @override
  OutlinedBorder copyWith({BorderSide? side}) => this;

  @override
  Path getInnerPath(Rect rect, {TextDirection? textDirection}) {
    return getOuterPath(rect);
  }

  @override
  Path getOuterPath(Rect rect, {TextDirection? textDirection}) {
    Path path = Path()..addRect(rect);

    return path;
  }

  @override
  void paint(Canvas canvas, Rect rect, {TextDirection? textDirection}) {
    final path = Path()
      ..moveTo(rect.left, rect.top)
      ..quadraticBezierTo(rect.left + (rect.width / 2), rect.bottom - (rect.height / 2), rect.right, rect.top)
      ..lineTo(rect.bottomRight.dx, rect.bottomRight.dy)
      ..lineTo(rect.bottomLeft.dx, rect.bottomLeft.dy)
      ..lineTo(rect.topLeft.dx, rect.topLeft.dy);

    final paint = Paint()
      ..shader = LinearGradient(
        colors: [
          Color(0xFF3A3A6A).withOpacity(.26),
          Color(0xFF25244C).withOpacity(.26),
        ],
        begin: Alignment(.5, -1),
        end: Alignment(.5, 1),
      ).createShader(rect);

    canvas.drawPath(path, paint);
  }

  @override
  ShapeBorder scale(double t) => this;
}
