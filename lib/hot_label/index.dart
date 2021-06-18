import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

///热门标签
class VooHotLabel extends StatelessWidget {
  final String title;
  final String subTitle;
  final TextStyle titleStyle;
  final TextStyle subTitleStyle;
  final List<String> list;
  final bool itemFixed;
  final double itemWidth;
  final double itemHeight;
  final Color itemBgColor;
  final double itemBorderRadius;
  final TextStyle itemStyle;
  final double itemSpacing;
  final double itemRunSpacing;

  VooHotLabel({
    @required this.title,
    @required this.subTitle,
    this.titleStyle,
    this.subTitleStyle,
    @required this.list,
    this.itemFixed = false, //宽高是否固定
    this.itemWidth,
    this.itemHeight,
    this.itemBgColor = const Color(0xffE5E5E5),
    this.itemBorderRadius,
    this.itemStyle,
    this.itemSpacing,
    this.itemRunSpacing,
  });

  ///item 视图
  Widget itemView(String value) {
    Widget textView = Text(
      value,
      style: itemStyle ??
          TextStyle(
            fontSize: 32.sp,
            color: Color(0xff333333),
          ),
      overflow: TextOverflow.ellipsis,
      maxLines: 1,
    );
    if (itemFixed) {
      return Container(
        width: 156.w,
        height: 60.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(itemBorderRadius ?? 10.r),
          color: itemBgColor,
        ),
        alignment: Alignment.center,
        child: textView,
      );
    } else {
      return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(itemBorderRadius ?? 10.r),
          color: itemBgColor,
        ),
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
        child: textView,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> children = [];
    children.add(Container(
      alignment: Alignment.centerLeft,
      child: Text(
        title,
        style: titleStyle ?? TextStyle(fontSize: 56.sp, color: Color(0xff333333)),
      ),
    ));

    children.add(Container(
      alignment: Alignment.centerLeft,
      margin: EdgeInsets.only(top: 32.h),
      child: Text(
        subTitle,
        style: subTitleStyle ?? TextStyle(fontSize: 36.sp, color: Color(0xff999999)),
      ),
    ));

    children.add(Container(
      margin: EdgeInsets.only(top: 16.h),
      child: Wrap(
        spacing: itemSpacing ?? 24.w,
        runSpacing: itemRunSpacing ?? 24.h,
        alignment: WrapAlignment.start,
        crossAxisAlignment: WrapCrossAlignment.start,
        children: list.map((e) => itemView(e)).toList(),
      ),
    ));

    return Column(
      children: children,
      crossAxisAlignment: CrossAxisAlignment.start,
    );
  }
}
