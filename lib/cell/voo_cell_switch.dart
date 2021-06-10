import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:voo/switch/index.dart';

///单元-开关
class VooCellSwitch extends StatelessWidget {
  final String title;
  final TextStyle style;
  final Widget leading;
  final bool checked;
  final Function(bool value) onChanged;
  final Color activeColor;
  final Color trackColor;

  VooCellSwitch({
    this.title = '',
    this.style,
    this.leading,
    this.checked = false,
    this.onChanged,
    this.activeColor,
    this.trackColor,
  });

  ///前面视图
  Widget leadingView() {
    Widget titleView = Text(
      title,
      style: style ??
          TextStyle(
            fontSize: 32.sp,
            color: Color(0xff333333),
          ),
    );

    if (leading != null) {
      List<Widget> children = [];
      children.add(leading);
      children.add(SizedBox(width: 24.w));
      children.add(titleView);
      return Row(children: children, crossAxisAlignment: CrossAxisAlignment.center);
    }
    return titleView;
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> children = [];
    children.add(leadingView());
    children.add(Expanded(
      child: Container(
        alignment: Alignment.centerRight,
        child: VooSwitch(
          value: checked,
          activeColor: activeColor,
          trackColor: trackColor,
          onChanged: onChanged,
        ),
      ),
    ));
    Widget child = Container(
      constraints: BoxConstraints(minHeight: 100.h),
      color: Colors.white,
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.symmetric(horizontal: 32.w),
      child: Row(
        children: children,
        crossAxisAlignment: CrossAxisAlignment.center,
      ),
    );

    return child;
  }
}
