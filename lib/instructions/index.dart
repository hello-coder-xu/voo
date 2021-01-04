import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';

///指示器
class VooInstructions extends StatelessWidget {
  final int total;
  final int index;
  final Color bgColor;
  final Color activeColor;
  final Color trackColor;

  VooInstructions({
    @required this.total,
    @required this.index,
    this.bgColor = const Color(0xff25C489),
    this.activeColor = const Color(0xff000000),
    this.trackColor = const Color(0x50FFFFFF),
  })  : assert(total != null && total > 0),
        assert(index != null && index >= 0 && index < total);

  @override
  Widget build(BuildContext context) {
    List<Widget> children = [];

    List.generate(total, (value) {
      children.add(Container(
        width: ScreenUtil().setWidth(14),
        height: ScreenUtil().setWidth(14),
        decoration: BoxDecoration(
          borderRadius:
              BorderRadius.all(Radius.circular(ScreenUtil().setWidth(14))),
          color: value == index ? activeColor : trackColor,
        ),
        margin: EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(14)),
      ));
    });
    return ClipRRect(
      borderRadius: BorderRadius.horizontal(
        left: Radius.circular(ScreenUtil().setWidth(32)),
        right: Radius.circular(ScreenUtil().setWidth(32)),
      ),
      child: Container(
        color: bgColor,
        height: ScreenUtil().setHeight(32),
        padding: EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(14)),
        child: Row(children: children, mainAxisSize: MainAxisSize.min),
      ),
    );
  }
}
