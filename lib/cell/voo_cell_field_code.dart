import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:voo/field/index.dart';

///验证码
class VooCellFieldCode extends StatelessWidget {
  final String title;
  final TextStyle? titleStyle;
  final double? titleWidth;
  final String? trailing;
  final TextStyle? trailingStyle;
  final VoidCallback? onTrailing;
  final double? paddingWidth;

  //输入框属性
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

  VooCellFieldCode({
    required this.title,
    this.titleStyle,
    this.titleWidth,
    this.trailing,
    this.trailingStyle,
    this.onTrailing,
    this.paddingWidth,
    this.textFieldTheme = TextFieldStyle.none,
    this.prefixIcon,
    this.hintText,
    this.suffixIcon,
    this.style = const TextStyle(fontSize: 16, color: Colors.black87),
    this.hintStyle = const TextStyle(fontSize: 16, color: Colors.black54),
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

  Widget trailingView() {
    List<Widget> children = [];
    children.add(Container(
      margin: EdgeInsets.only(left: 16.w),
      height: 40.h,
      width: 1,
      color: Color(0xffe5e5e5),
    ));
    children.add(Container(
      constraints: BoxConstraints(minHeight: 76.h),
      margin: EdgeInsets.only(left: 16.w),
      alignment: Alignment.center,
      child: Text(
        trailing!,
        style: trailingStyle ?? TextStyle(fontSize: 32.sp, color: Color(0xff25c489)),
      ),
    ));
    return GestureDetector(
      onTap: onTrailing,
      child: Row(children: children),
    );
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> children = [];

    children.add(Container(
      alignment: Alignment.centerLeft,
      width: titleWidth ?? 128.w,
      constraints: BoxConstraints(minHeight: 76.h),
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
        alignment: Alignment.center,
        constraints: BoxConstraints(minHeight: 76.h),
        child: VooTextField(
          style: textFieldTheme,
          prefixIcon: prefixIcon,
          hintText: hintText,
          suffixIcon: suffixIcon,
          textStyle: style,
          hintStyle: hintStyle,
          textAlign: textAlign,
          textAlignVertical: textAlignVertical,
          filled: filled,
          fillColor: fillColor,
          borderColor: borderColor,
          borderWidth: borderWidth,
          borderRadius: borderRadius,
          showPwd: showPwd,
          showClear: showClear,
          maxLines: maxLines,
          minLines: minLines,
          maxLength: maxLength,
          readOnly: readOnly,
          enabled: enabled,
          onChanged: onChanged,
          onEditingComplete: onEditingComplete,
          onSubmitted: onSubmitted,
          inputFormatters: inputFormatters,
          keyboardType: keyboardType,
          textInputAction: textInputAction,
          controller: controller,
        ),
      ),
    ));
    if (trailing != null) {
      children.add(trailingView());
    }

    return Container(
      color: Colors.white,
      constraints: BoxConstraints(minHeight: 76.h),
      padding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 8.h),
      child: Row(
        children: children,
        crossAxisAlignment: CrossAxisAlignment.start,
      ),
    );
  }
}
