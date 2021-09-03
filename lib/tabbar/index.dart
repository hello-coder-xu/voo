import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

typedef OnRadiusChanged = BorderRadius Function(double offsetIndex);

enum IndicatorAlignment { top, center, bottom }

/// 自定义TabBar样式
/// Round Rectangle
class RoundTabIndicator extends Decoration {
  final double height;
  final double width;
  final Color? color;
  final BorderRadius? borderRadius;
  final IndicatorAlignment? alignment;
  final OnRadiusChanged? onRadiusChanged;

  RoundTabIndicator({
    required this.height,
    required this.width,
    this.color,
    this.borderRadius,
    this.alignment,
    this.onRadiusChanged,
  });

  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    return _CustomPainter(this, onChanged);
  }
}

class _CustomPainter extends BoxPainter {
  _CustomPainter(
    this.decoration,
    VoidCallback? onChanged,
  ) : super(onChanged);

  final RoundTabIndicator decoration;

  Color? get color => decoration.color;

  double get width => decoration.width;

  double get height => decoration.height;

  BorderRadius? get borderRadius => decoration.borderRadius;

  IndicatorAlignment? get alignment => decoration.alignment;

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    assert(configuration.size != null);

    //offset is the position from where the decoration should be drawn.
    //configuration.size tells us about the height and width of the tab.
    final Rect rect = offset & configuration.size!;
    final Paint paint = Paint();
    paint.color = color ?? Color(0xFF333333);
    paint.style = PaintingStyle.fill;

    double itemWidth = rect.right - rect.left;
    double pWidth = itemWidth > width ? width : itemWidth;

    double itemHeight = rect.bottom - rect.top;
    double pHeight = itemHeight > height ? height : itemHeight;

    double offsetX = itemWidth / 2 - pWidth / 2;
    double offsetY = getOffsetY(itemHeight, pHeight, rect);

    BorderRadius pBorderRadius = borderRadius ?? BorderRadius.circular(5);
    if (decoration.onRadiusChanged != null)
      pBorderRadius = decoration.onRadiusChanged!(offset.dx / itemWidth);

    canvas.drawRRect(
      RRect.fromRectAndCorners(
        Rect.fromLTWH(
          rect.left + offsetX,
          rect.top + offsetY,
          pWidth,
          pHeight,
        ),
        topLeft: pBorderRadius.topLeft,
        topRight: pBorderRadius.topRight,
        bottomLeft: pBorderRadius.bottomLeft,
        bottomRight: pBorderRadius.bottomRight,
      ),
      paint,
    );
  }

  double getOffsetY(double itemHeight, double pHeight, Rect rect) {
    switch (alignment) {
      case IndicatorAlignment.top:
        return rect.top;
      case IndicatorAlignment.center:
        return pHeight < itemHeight
            ? (itemHeight - pHeight) / 2
            : (itemHeight - pHeight);
      case IndicatorAlignment.bottom:
        return itemHeight - pHeight;
      default: //
        return itemHeight - pHeight;
    }
  }
}
