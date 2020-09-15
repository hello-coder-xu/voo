import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class VooCircleMask extends StatelessWidget {
  /// Color of mask
  final Color maskColor;

  /// Color of hollow circle
  final Color holeColor;

  /// Size of mask, width and height
  final Size size;

  /// Offset for hollow circle
  final Offset offset;

  /// Radius for hollow circle
  final double radius;

  const VooCircleMask({
    Key key,
    this.maskColor = Colors.black12,
    this.holeColor = Colors.white,
    this.size = const Size(100, 100),
    this.offset = const Offset(20, 20),
    this.radius = 20,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: VooCircleMaskPainter(
        maskColor: maskColor,
        holeColor: holeColor,
        offset: offset,
        radius: radius,
      ),
      size: size,
    );
  }
}

class VooCircleMaskPainter extends CustomPainter {
  /// Color of mask
  final Color maskColor;

  /// Color of hollow circle
  final Color holeColor;

  /// Offset for hollow circle
  final Offset offset;

  /// Radius for hollow circle
  final double radius;

  VooCircleMaskPainter({
    this.maskColor = Colors.black12,
    this.holeColor = Colors.white,
    this.offset = const Offset(20, 20),
    this.radius = 20,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();
    // Reduces the clip region to the intersection of the current clip and the given rectangle.
    Rect rect = Rect.fromLTRB(0.0, 0.0, size.width, size.height);
    canvas.clipRect(rect);
    // Draw the mask with specified color
    paint.color = maskColor;
    canvas.drawRect(rect, paint);
    // Draw the hollow circle with specified color
    paint.color = holeColor;
    paint.blendMode = BlendMode.overlay;
    canvas.drawCircle(offset, radius, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

class VooRRectMask extends StatelessWidget {
  /// Color of mask
  final Color maskColor;

  /// Color of hollow rectangle
  final Color holeColor;

  /// Size of mask, width and height
  final Size size;

  /// Offset for hollow rectangle
  final Offset offset;

  /// Width for hollow rectangle
  final double width;

  /// Height for hollow rectangle
  final double height;

  /// Corner radius for hollow rectangle
  final double cornerRadius;

  const VooRRectMask({
    Key key,
    this.maskColor = Colors.black12,
    this.holeColor = Colors.white,
    this.size = const Size(100, 100),
    this.offset = const Offset(30, 30),
    this.width = 40,
    this.height = 40,
    this.cornerRadius = 0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: VooRRectMaskPainter(
        maskColor: maskColor,
        holeColor: holeColor,
        offset: offset,
        width: width,
        height: height,
        cornerRadius: cornerRadius,
      ),
      size: size,
    );
  }
}

class VooRRectMaskPainter extends CustomPainter {
  /// Color of mask
  final Color maskColor;

  /// Color of hollow rectangle
  final Color holeColor;

  /// Offset for hollow rectangle
  final Offset offset;

  /// Width for hollow rectangle
  final double width;

  /// Height for hollow rectangle
  final double height;

  /// Corner radius for hollow rectangle
  final double cornerRadius;

  VooRRectMaskPainter({
    this.maskColor = Colors.black12,
    this.holeColor = Colors.white,
    this.offset = const Offset(30, 30),
    this.width = 40,
    this.height = 40,
    this.cornerRadius = 0,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();
    // Reduces the clip region to the intersection of the current clip and the given rectangle.
    Rect rect = Rect.fromLTRB(0.0, 0.0, size.width, size.height);
    canvas.clipRect(rect);
    // Draw the mask with specified color
    paint.color = maskColor;
    canvas.drawRect(rect, paint);
    // Draw the hollow rectangle with specified color
    paint.color = holeColor;
    paint.blendMode = BlendMode.overlay;
    canvas.drawRRect(
        RRect.fromRectAndRadius(
          Rect.fromLTWH(offset.dx, offset.dy, width, height),
          Radius.circular(cornerRadius),
        ),
        paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
