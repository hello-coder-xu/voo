import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const double DEFAULT_OFFSET = 4;

/// A bubble widget and it's similar to Container.
/// It can wrap any other widgets which are supported by Container.
///
/// ## Example:
///
/// This example shows how to show a text in BubbleBox.
/// ```dart
/// BubbleBox(
///   width: 200,
///   child: Text(
///     "121213213s2sdfsds233d51",
///     style: TextStyle(color: Colors.white),
///   ),
/// )
/// ```
class BubbleBox extends StatelessWidget {
  /// The color to paint behind the [child].
  final Color color;

  final Radius radius;

  final EdgeInsetsGeometry padding;

  /// It indicate the arrow will be show on which side.
  final ArrowDirection arrowDirection;

  /// Align the arrow within the BubbleBox.
  final ArrowAlignment arrowAlignment;

  /// Set the arrow size in the BubbleBox.
  final double arrowSize;

  /// Set the arrow offset according to [arrowAlignment].
  final double arrowOffset;

  final double elevation;

  /// Additional constraints to apply to the child.
  ///
  /// The constructor `width` and `height` arguments are combined with the
  /// `constraints` argument to set this property.
  final BoxConstraints constraints;
  final Widget child;

  BubbleBox({
    Key key,
    double width,
    double height,
    BoxConstraints constraints,
    this.color = Colors.blue,
    this.radius = Radius.zero,
    this.padding,
    this.arrowDirection = ArrowDirection.left,
    this.arrowAlignment = ArrowAlignment.start,
    this.arrowSize = 6,
    this.arrowOffset = 0,
    this.elevation = 0,
    @required this.child,
  })  : assert(constraints == null || constraints.debugAssertIsValid()),
        constraints = (width != null || height != null)
            ? constraints?.tighten(width: width, height: height) ??
                BoxConstraints.tightFor(width: width, height: height)
            : constraints,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: BubblePainter(
        color: color,
        radius: radius,
        arrowDirection: arrowDirection,
        arrowSize: arrowSize,
        arrowOffset: arrowOffset,
        arrowAlignment: arrowAlignment,
        elevation: elevation,
      ),
      child: Padding(
        padding: getChildOffset(),
        child: Container(
          padding: padding ?? EdgeInsets.all(8),
          constraints: constraints,
          child: child,
        ),
      ),
    );
  }

  EdgeInsets getChildOffset() {
    switch (arrowDirection) {
      case ArrowDirection.left:
        return EdgeInsets.only(left: arrowSize);
      case ArrowDirection.right:
        return EdgeInsets.only(right: arrowSize);
      case ArrowDirection.top:
        return EdgeInsets.only(top: arrowSize);
      case ArrowDirection.bottom:
        return EdgeInsets.only(bottom: arrowSize);
    }
    return EdgeInsets.only(left: arrowSize);
  }
}

class BubblePainter extends CustomPainter {
  final Color color;
  final Radius radius;
  final ArrowDirection arrowDirection;
  final ArrowAlignment arrowAlignment;
  final double arrowSize;
  final double arrowOffset;
  final double elevation;

  const BubblePainter({
    this.color,
    this.radius,
    this.arrowDirection,
    this.arrowAlignment,
    this.arrowSize,
    this.arrowOffset,
    this.elevation,
  });

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..isAntiAlias = true
      ..style = PaintingStyle.fill
      ..color = color;

    drawBox(canvas, size, paint);
  }

  void drawBox(Canvas canvas, Size size, Paint paint) {
    switch (arrowDirection) {
      case ArrowDirection.left:
        drawLeft(canvas, size, paint);
        break;
      case ArrowDirection.right:
        drawRight(canvas, size, paint);
        break;
      case ArrowDirection.top:
        drawTop(canvas, size, paint);
        break;
      case ArrowDirection.bottom:
        drawBottom(canvas, size, paint);
        break;
    }
  }

  void drawLeft(Canvas canvas, Size size, Paint paint) {
    Rect rect = Rect.fromLTRB(0, 0, size.width - arrowSize / 2, size.height);
    Path path = Path()..addRect(rect.translate(arrowSize, 0));
    canvas.drawShadow(path, Colors.grey.shade100, elevation, true);

    canvas.drawRRect(
      RRect.fromLTRBR(arrowSize, 0, size.width, size.height, radius),
      paint,
    );

    double offset = arrowSize + DEFAULT_OFFSET + arrowOffset;
    if (arrowAlignment == ArrowAlignment.center) {
      offset = size.height / 2 + arrowOffset;
    }
    if (arrowAlignment == ArrowAlignment.end) {
      offset = size.height - arrowSize - DEFAULT_OFFSET - arrowOffset;
    }

    path = Path()
      ..moveTo(0, offset)
      ..lineTo(arrowSize, offset - arrowSize / 3 * 2)
      ..lineTo(arrowSize, offset + arrowSize / 3 * 2);
    canvas.drawPath(path, paint);
  }

  void drawRight(Canvas canvas, Size size, Paint paint) {
    Rect rect = Rect.fromLTRB(0, 0, size.width - arrowSize / 2, size.height);
    Path path = Path()..addRect(rect.translate(-arrowSize / 2, 0));
    canvas.drawShadow(path, Colors.grey.shade100, elevation, true);

    canvas.drawRRect(
      RRect.fromLTRBR(0, 0, size.width - arrowSize, size.height, radius),
      paint,
    );

    double offset = arrowSize + DEFAULT_OFFSET + arrowOffset;
    if (arrowAlignment == ArrowAlignment.center) {
      offset = size.height / 2 + arrowOffset;
    }
    if (arrowAlignment == ArrowAlignment.end) {
      offset = size.height - arrowSize - DEFAULT_OFFSET - arrowOffset;
    }
    path = Path()
      ..moveTo(size.width, offset)
      ..lineTo(size.width - arrowSize, offset - arrowSize / 3 * 2)
      ..lineTo(size.width - arrowSize, offset + arrowSize / 3 * 2);
    canvas.drawPath(path, paint);
  }

  void drawTop(Canvas canvas, Size size, Paint paint) {
    Rect rect = Rect.fromLTRB(0, arrowSize / 2, size.width, size.height);
    Path path = Path()..addRect(rect.translate(arrowSize / 2, 0));
    canvas.drawShadow(path, Colors.grey.shade100, elevation, true);

    canvas.drawRRect(
      RRect.fromLTRBR(0, arrowSize, size.width, size.height, radius),
      paint,
    );

    double offset = arrowSize + DEFAULT_OFFSET + arrowOffset;
    if (arrowAlignment == ArrowAlignment.center) {
      offset = size.width / 2 + arrowOffset;
    }
    if (arrowAlignment == ArrowAlignment.end) {
      offset = size.width - arrowSize - DEFAULT_OFFSET - arrowOffset;
    }

    path = Path()
      ..moveTo(offset, 0)
      ..lineTo(offset - arrowSize / 3 * 2, arrowOffset + arrowSize)
      ..lineTo(offset + arrowSize / 3 * 2, arrowOffset + arrowSize);
    canvas.drawPath(path, paint);
  }

  void drawBottom(Canvas canvas, Size size, Paint paint) {
    Rect rect = Rect.fromLTRB(0, 0, size.width, size.height - arrowSize);
    Path path = Path()..addRect(rect.translate(arrowSize / 2, 0));
    canvas.drawShadow(path, Colors.grey.shade100, elevation, true);

    canvas.drawRRect(
      RRect.fromLTRBR(0, 0, size.width, size.height - arrowSize, radius),
      paint,
    );

    double offset = arrowSize + DEFAULT_OFFSET + arrowOffset;
    if (arrowAlignment == ArrowAlignment.center) {
      offset = size.width / 2 + arrowOffset;
    }
    if (arrowAlignment == ArrowAlignment.end) {
      offset = size.width - arrowSize - DEFAULT_OFFSET - arrowOffset;
    }

    var dy = size.height - arrowOffset - arrowSize;
    path = Path()
      ..moveTo(offset, size.height)
      ..lineTo(offset - arrowSize / 3 * 2, dy)
      ..lineTo(offset + arrowSize / 3 * 2, dy);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}

enum ArrowDirection { left, right, top, bottom }
enum ArrowAlignment { start, center, end }
