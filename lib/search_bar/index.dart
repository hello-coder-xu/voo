import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:voo/field/index.dart';

///搜索栏
class VooSearchBar extends StatelessWidget {
  //前缀视图
  final Widget? leading;
  //后缀视图
  final Widget? trailing;
  //背景颜色
  final Color? bgColor;

  //-------输入框属性 详情看VooTextFiled------
  final TextFieldStyle textFieldTheme;
  final Widget? prefixIcon;
  final String? hintText;
  final Widget? suffixIcon;

  final TextStyle style;
  final TextStyle hintStyle;
  final TextAlign textAlign;
  final TextAlignVertical textAlignVertical;

  final bool filled;
  final Color fillColor;
  final Color borderColor;
  final double borderWidth;
  final BorderRadius borderRadius;

  final bool showPwd;
  final bool showClear;

  final int maxLines;
  final int? minLines;
  final int? maxLength;
  final bool readOnly;
  final bool enabled;

  final ValueChanged<String>? onChanged;
  final VoidCallback? onEditingComplete;
  final ValueChanged<String>? onSubmitted;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final TextEditingController? controller;

  VooSearchBar({
    this.leading,
    this.trailing,
    this.bgColor,
    this.textFieldTheme = TextFieldStyle.none,
    this.prefixIcon,
    this.hintText,
    this.suffixIcon,
    this.style = const TextStyle(fontSize: 14, color: Colors.black87),
    this.hintStyle = const TextStyle(fontSize: 14, color: Colors.black54),
    this.textAlign = TextAlign.left,
    this.textAlignVertical = TextAlignVertical.center,
    this.maxLength,
    this.maxLines = 1,
    this.minLines,
    this.readOnly = false,
    this.enabled = true,
    this.filled = false,
    this.fillColor = const Color(0xFFF5F5F5),
    this.borderColor = const Color(0xFFEEEEEE),
    this.borderWidth = 1,
    this.borderRadius = const BorderRadius.all(Radius.circular(4)),
    this.showPwd = false,
    this.showClear = false,
    this.onChanged,
    this.onEditingComplete,
    this.onSubmitted,
    this.inputFormatters,
    this.keyboardType,
    this.textInputAction,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    List<Widget> children = [];
    if (leading != null) {
      children.add(Container(
        constraints: BoxConstraints(maxHeight: 96.w),
        margin: EdgeInsets.only(right: 16.w),
        child: leading,
        alignment: Alignment.center,
      ));
    }

    children.add(Expanded(
      child: Container(
        height: 64.w,
        child: VooTextField(
          style: TextFieldStyle.border,
          borderColor: borderColor,
          borderWidth: 1,
          borderRadius: BorderRadius.all(Radius.circular(32.w)),
          fillColor: fillColor,
          filled: true,
          prefixIcon: prefixIcon ??
              Icon(
                Icons.search,
                color: Color(0xffbfbfbf),
                size: 36.w,
              ),
          hintText: hintText,
          hintStyle: hintStyle,
          textStyle: style,
          textAlign: textAlign,
          maxLength: maxLength,
          maxLines: 1,
          enabled: true,
          showPwd: false,
          showClear: showClear,
          onChanged: onChanged,
          onSubmitted: onSubmitted,
          onEditingComplete: onEditingComplete,
          inputFormatters: inputFormatters,
          keyboardType: keyboardType,
          textInputAction: textInputAction,
          readOnly: readOnly,
          controller: controller,
        ),
      ),
    ));

    if (trailing != null) {
      children.add(Container(
        constraints: BoxConstraints(maxHeight: 96.w),
        margin: EdgeInsets.only(left: 16.w),
        child: trailing,
        alignment: Alignment.center,
      ));
    }

    return Container(
      height: 96.w,
      padding: EdgeInsets.symmetric(horizontal: 32.w),
      alignment: Alignment.center,
      color: bgColor ?? Colors.white,
      child: Row(children: children, crossAxisAlignment: CrossAxisAlignment.center),
    );
  }
}
