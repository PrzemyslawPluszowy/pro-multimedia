import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:pro_multimedia/core/theme/static_colors.dart';

class HalfCircleButton extends StatelessWidget {
  const HalfCircleButton({
    required this.onTap,
    required this.hasError,
    super.key,
  });

  final void Function() onTap;
  static const double height = 33;
  static const double width = 60;

  /// Ta zmienna zmienia ikone w przypadku błędu łądowania filmu
  final ValueNotifier<bool> hasError;

  @override
  Widget build(BuildContext context) {
    return RotatedBox(
      quarterTurns: 2,
      child: ClipPath(
        clipper: HalfCircleBtnClipper(),
        child: Container(
          height: height,
          width: width,
          color: StaticColors.primaryColor,
          child: Center(
            child: IconButton(
              icon: ValueListenableBuilder(
                valueListenable: hasError,
                builder: (context, bool hasError, _) => hasError
                    ? const Icon(
                        Ionicons.refresh,
                        color: StaticColors.containerColor,
                      )
                    : const Icon(
                        Ionicons.chevron_up_outline,
                        color: StaticColors.containerColor,
                      ),
              ),
              onPressed: onTap,
            ),
          ),
        ),
      ),
    );
  }
}

class HalfCircleBtnClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path()
      ..moveTo(0, size.height)
      ..arcToPoint(
        Offset(size.width, size.height),
        radius: Radius.circular(size.width / 2),
      )
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height)
      ..close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
