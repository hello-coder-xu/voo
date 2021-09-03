import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:voo/field/index.dart';

///文本输入单元格
class VooCellField extends StatelessWidget {
  //标题
  final String? title;
  //标题字体样式
  final TextStyle? titleStyle;
  //标题显示长度
  final double? titleWidth;
  //错误文本
  final String? errorText;
  //错误文本字体样式
  final TextStyle? errorStyle;
  //后缀文本
  final String? trailing;
  //后缀文本字体样式
  final TextStyle? trailingStyle;
  //标题与输入框之间距离
  final double? paddingWidth;

  //----------输入框属性 详情见VooTextField-----------
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

  VooCellField({
    this.title,
    this.titleStyle,
    this.titleWidth,
    this.errorText,
    this.errorStyle,
    this.trailing,
    this.trailingStyle,
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

  Widget topView() {
    List<Widget> children = [];

    children.add(Container(
      alignment: Alignment.centerLeft,
      width: titleWidth ?? 128.w,
      constraints: BoxConstraints(minHeight: 76.h),
      child: Text(
        title!,
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
      children.add(Container(
        constraints: BoxConstraints(minHeight: 76.h),
        margin: EdgeInsets.only(left: 16.w),
        alignment: Alignment.center,
        child: Text(
          trailing!,
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
      margin: EdgeInsets.only(left: paddingWidth ?? 56.w),
      alignment: Alignment.centerRight,
      child: Text(
        errorText!,
        style: errorStyle ??
            TextStyle(
              fontSize: 28.sp,
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
      padding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 8.h),
      child: child,
    );
  }
}
