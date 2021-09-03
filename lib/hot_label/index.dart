import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

///热门标签
class VooHotLabel extends StatelessWidget {
  //标题
  final String title;
  //副标题
  final String subTitle;
  //标题字体样式
  final TextStyle? titleStyle;
  //副标题字体样式
  final TextStyle? subTitleStyle;
  //内容数组
  final List<String> list;
  //item 是否固定宽高
  final bool itemFixed;
  //item 宽度
  final double? itemWidth;
  //item 高度
  final double? itemHeight;
  //item 背景颜色
  final Color itemBgColor;
  //item 边框圆角
  final double? itemBorderRadius;
  //item 字体样式
  final TextStyle? itemStyle;
  //item 水平间距
  final double? itemSpacing;
  //item 垂直间距
  final double? itemRunSpacing;

  VooHotLabel({
    required this.title,
    required this.subTitle,
    this.titleStyle,
    this.subTitleStyle,
    required this.list,
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
