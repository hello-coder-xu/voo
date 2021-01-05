import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

///复选框-图标
class VooCheckBoxIcon extends StatelessWidget {
  final Icon selectIcon;
  final Icon unSelectIcon;
  final bool value;

  VooCheckBoxIcon({
    @required this.value,
    this.selectIcon,
    this.unSelectIcon,
  });

  @override
  Widget build(BuildContext context) {
    assert(value != null);
    Widget child;
    if (value) {
      child = selectIcon ??
          Icon(
            Icons.check_circle,
            size: ScreenUtil().setWidth(44),
            color: Color(0xff25c489),
          );
    } else {
      child = unSelectIcon ??
          Icon(
            Icons.radio_button_unchecked,
            size: ScreenUtil().setWidth(44),
            color: Color(0xffb6b6b6),
          );
    }
    return child;
  }
}
