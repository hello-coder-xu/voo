import 'package:flutter/material.dart';

///微标
class VooBadge extends StatelessWidget {
  final dynamic child;
  final bool isPoint;
  final Color color;

  VooBadge({
    this.child,
    this.isPoint = true,
    this.color = Colors.red,
  }) : assert(child == null || child.runtimeType == String || child.runtimeType == int || child.runtimeType == Widget);

  @override
  Widget build(BuildContext context) {
    if (isPoint) {
      return Container(
        width: 5,
        height: 5,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.horizontal(left: Radius.circular(20), right: Radius.circular(20)),
          color: color,
        ),
      );
    } else {
      Widget tempChild;
      if (child is String || child is int) {
        tempChild = Text('$child');
      } else {
        tempChild = child;
      }

      return Container(
        padding: EdgeInsets.symmetric(horizontal: 4),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.horizontal(left: Radius.circular(20), right: Radius.circular(20)),
          color: color,
        ),
        child: DefaultTextStyle(
          style: TextStyle(fontSize: 10, color: Colors.white),
          child: tempChild,
        ),
      );
    }
  }
}
