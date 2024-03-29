import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

///指示器
class VooInstructions extends StatelessWidget {
  final int total;
  final int index;
  final Color bgColor;
  final Color activeColor;
  final Color trackColor;

  VooInstructions({
    required this.total,
    required this.index,
    this.bgColor = const Color(0xff25C489),
    this.activeColor = const Color(0xff000000),
    this.trackColor = const Color(0x50FFFFFF),
  })  : assert(total > 0),
        assert(index >= 0 && index < total);

  @override
  Widget build(BuildContext context) {
    List<Widget> children = [];

    List.generate(total, (value) {
      children.add(Container(
        width: 14.w,
        height: 14.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(14.w)),
          color: value == index ? activeColor : trackColor,
        ),
        margin: EdgeInsets.symmetric(horizontal: 14.w),
      ));
    });
    return ClipRRect(
      borderRadius: BorderRadius.horizontal(
        left: Radius.circular(32.w),
        right: Radius.circular(32.w),
      ),
      child: Container(
        color: bgColor,
        height: 32.h,
        padding: EdgeInsets.symmetric(horizontal: 14.w),
        child: Row(children: children, mainAxisSize: MainAxisSize.min),
      ),
    );
  }
}
