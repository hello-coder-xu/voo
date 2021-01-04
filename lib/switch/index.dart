import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

///切换视图
class VooSwitch extends StatelessWidget {
  final bool value;
  final Function(bool value) onChanged;
  final Color activeColor;
  final Color trackColor;

  VooSwitch({
    this.value = false,
    this.onChanged,
    this.activeColor,
    this.trackColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenUtil().setWidth(100),
      height: ScreenUtil().setHeight(64),
      child: CupertinoSwitch(
        value: value,
        onChanged: onChanged,
        activeColor: activeColor,
        trackColor: trackColor,
      ),
    );
  }
}
