import 'package:flutter/material.dart';

class VooMaskView extends StatelessWidget {
  final Size size;
  final Offset offset;
  final Widget child;

  VooMaskView({
    Key key,
    this.size = Size.zero,
    this.offset = Offset.zero,
    this.child,
  }):super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> children = [];
    children.add(GestureDetector(
      onTap: () => close(context),
      child: Container(color: Color.fromRGBO(0, 0, 0, 0.5)),
    ));
    if (this.child != null) {
      children.add(this.child);
    }
    return ClipPath(
      clipper: VooInvertedCircleClipper(maskSize: size, maskOffset: offset),
      child: Stack(children: children),
    );
  }

  void close(BuildContext context) {
    Navigator.pop(context);
  }
}

class VooInvertedCircleClipper extends CustomClipper<Path> {
  final Size maskSize;
  final Offset maskOffset;

  VooInvertedCircleClipper({
    this.maskSize = Size.zero,
    this.maskOffset = Offset.zero,
  });

  @override
  Path getClip(Size size) {
    return Path()
      ..addRect(Rect.fromLTWH(maskOffset.dx, maskOffset.dy, maskSize.width, maskSize.height))
      ..addRect(Rect.fromLTWH(0.0, 0.0, size.width, size.height))
      ..fillType = PathFillType.evenOdd;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
