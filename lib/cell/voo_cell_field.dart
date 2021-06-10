import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:voo/field/index.dart';

///
class VooCellField extends StatelessWidget {
  final String title;
  final TextStyle titleStyle;
  final double titleWidth;
  final String hintText;
  final TextStyle hintStyle;
  final TextInputType keyboardType;
  final List<TextInputFormatter> inputFormatters;
  final InputBorder border;
  final String errorText;
  final TextStyle errorStyle;
  final int maxLength;
  final int minLines;
  final int maxLines;
  final TextAlign align;
  final TextEditingController controller;
  final ValueChanged<String> onChanged;
  final VoidCallback onEditingComplete;
  final ValueChanged<String> onSubmitted;
  final String trailing;
  final TextStyle trailingStyle;
  final double paddingWidth;
  final bool showPwd;
  final bool showClear;
  final bool readOnly;
  final bool enabled;

  VooCellField({
    @required this.title,
    this.titleStyle,
    this.titleWidth,
    this.hintText,
    this.hintStyle,
    this.keyboardType,
    this.inputFormatters,
    this.border,
    this.errorText,
    this.errorStyle,
    this.maxLength,
    this.minLines,
    this.maxLines = 1,
    this.align = TextAlign.end,
    this.controller,
    this.onChanged,
    this.onEditingComplete,
    this.onSubmitted,
    this.trailing,
    this.trailingStyle,
    this.paddingWidth,
    this.showPwd = false,
    this.showClear = false,
    this.readOnly = false,
    this.enabled = true,
  });

  Widget topView() {
    List<Widget> children = [];

    children.add(Container(
      alignment: Alignment.centerLeft,
      width: titleWidth ?? 128.w,
      constraints: BoxConstraints(minHeight: 100.h),
      child: Text(
        title,
        style: titleStyle ??
            TextStyle(
              fontSize: 32.sp,
              color: Color(0xff333333),
            ),
      ),
    ));

    children.add(SizedBox(width: paddingWidth ?? 56.w));

    children.add(Expanded(
      child: Container(
        constraints: BoxConstraints(minHeight: 100.h),
        alignment: Alignment.centerLeft,
        child: VooField(
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: hintStyle ??
                TextStyle(
                  fontSize: 32.sp,
                  color: Color(0xffb6b6b6),
                ),
            border: border ?? InputBorder.none,
            isCollapsed: maxLines == 1,
          ),
          style: titleStyle,
          maxLength: maxLength,
          maxLines: maxLines,
          minLines: minLines,
          keyboardType: keyboardType,
          inputFormatters: inputFormatters,
          textAlign: align,
          controller: controller,
          onChanged: onChanged,
          onEditingComplete: onEditingComplete,
          onSubmitted: onSubmitted,
          showClear: showClear,
          showPwd: showPwd,
          readOnly: readOnly,
          enabled: enabled,
        ),
      ),
    ));

    if (trailing != null) {
      children.add(Container(
        constraints: BoxConstraints(minHeight: 100.h),
        margin: EdgeInsets.only(left: 16.w),
        alignment: Alignment.center,
        child: Text(
          trailing,
          style: trailingStyle ??
              TextStyle(
                fontSize: 32.sp,
                color: Color(0xff333333),
              ),
        ),
      ));
    }
    return Row(
      children: children,
      crossAxisAlignment: CrossAxisAlignment.start,
    );
  }

  Widget bottomView() {
    return Container(
      constraints: BoxConstraints(minHeight: 80.h),
      margin: EdgeInsets.only(left: paddingWidth ?? 56.w),
      alignment: Alignment.centerRight,
      child: Text(
        errorText,
        style: errorStyle ??
            TextStyle(
              fontSize: 32.sp,
              color: Colors.red,
            ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget child = topView();
    if (errorText != null) {
      List<Widget> children = [];
      children.add(topView());
      children.add(bottomView());
      child = Column(children: children);
    }
    return Container(
      color: Colors.white,
      constraints: BoxConstraints(minHeight: 100.h),
      padding: EdgeInsets.symmetric(horizontal: 32.w),
      child: child,
    );
  }
}
