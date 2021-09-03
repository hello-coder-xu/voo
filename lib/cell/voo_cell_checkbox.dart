import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

///单元-单选择
class VooCellCheckBox extends StatelessWidget {
  final String title;
  final TextStyle? style;
  final Widget? leading;
  final bool checked;
  final Widget? checkView;
  final VoidCallback? onTap;

  VooCellCheckBox({
    this.title = '',
    this.style,
    this.leading,
    this.checked = false,
    this.checkView,
    this.onTap,
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
      List<Widget?> children = [];
      children.add(leading);
      children.add(SizedBox(width: 24.w));
      children.add(titleView);
      return Row(children: children as List<Widget>, crossAxisAlignment: CrossAxisAlignment.center);
    }
    return titleView;
  }

  ///后面视图
  Widget trailingView() {
    return checkView ??
        Icon(
          Icons.check,
          size: 48.w,
          color: Color(0xff25c489),
        );
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> children = [];
    children.add(leadingView());
    if (checked) {
      children.add(Expanded(
        child: Container(
          alignment: Alignment.centerRight,
          child: trailingView(),
        ),
      ));
    }
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

    if (onTap != null) {
      child = GestureDetector(onTap: onTap, child: child);
    }
    return child;
  }
}
