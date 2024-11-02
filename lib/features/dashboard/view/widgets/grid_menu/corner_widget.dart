// ignore_for_file: comment_references
import 'package:flutter/material.dart';
import 'package:pro_multimedia/core/theme/static_colors.dart';

/// Narożnik z dwoma liniami w kształcie litery odwróconej litery L.
/// używany w [GridMenu] jako dekoracja.

class CornerWidget extends StatelessWidget {
  const CornerWidget({
    super.key,
    this.lineLength = 15,
    this.lineWidth = 3.0,
    this.color = StaticColors.whiteColor,
  });

  final double lineLength;
  final double lineWidth;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(lineLength, lineLength), // Rozmiar narożnika
      painter: _CornerPainter(lineLength, lineWidth, color),
    );
  }
}

class _CornerPainter extends CustomPainter {
  _CornerPainter(this.lineLength, this.lineWidth, this.color);

  final double lineLength;
  final double lineWidth;
  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = lineWidth
      ..strokeCap = StrokeCap.round;

    canvas
      ..drawLine(
        Offset.zero,
        Offset(lineLength, 0),
        paint,
      )
      ..drawLine(
        Offset(lineLength, 0),
        Offset(lineLength, lineLength),
        paint,
      );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
