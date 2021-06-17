import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:voo/icon/index.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

enum TextFieldTheme { none, border }

///
class VooTextField extends StatefulWidget {
  final TextFieldTheme textFieldTheme;
  final Widget prefixIcon;
  final String hintText;
  final Widget suffixIcon;

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
  final int minLines;
  final int maxLength;
  final bool readOnly;
  final bool enabled;

  final ValueChanged<String> onChanged;
  final VoidCallback onEditingComplete;
  final ValueChanged<String> onSubmitted;
  final List<TextInputFormatter> inputFormatters;
  final TextInputType keyboardType;
  final TextInputAction textInputAction;
  final TextEditingController controller;

  VooTextField({
    this.textFieldTheme = TextFieldTheme.none,
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
  VooTextFieldState createState() => VooTextFieldState();
}

class VooTextFieldState extends State<VooTextField> {
  TextEditingController controller;
  bool obscureText;

  @override
  void initState() {
    super.initState();
    controller = widget.controller ?? TextEditingController();
    obscureText = widget.showPwd;
  }

  /// 获取装饰
  InputDecoration getDecoration() {
    InputBorder border;
    switch (widget.textFieldTheme) {
      case TextFieldTheme.none:
        border = OutlineInputBorder(
          borderRadius: BorderRadius.zero,
          borderSide: BorderSide(
            color: Colors.transparent,
            width: 0,
          ),
        );
        break;
      case TextFieldTheme.border:
        border = OutlineInputBorder(
          borderRadius: widget.borderRadius,
          borderSide: BorderSide(
            color: widget.borderColor,
            width: widget.borderWidth,
          ),
        );
        break;
    }

    //前缀与后缀视图
    Widget prefixIcon = widget.prefixIcon;
    Widget suffixIcon;
    Widget suffix;
    if (widget.showPwd) {
      //显示 密码隐藏可见按钮
      suffixIcon = GestureDetector(
        onTap: toggleShowPwd,
        child: Icon(
          obscureText ? VooIcon.view : VooIcon.close_eye,
          size: 32.w,
          color: Color(0xff333333),
        ),
      );
    } else if (widget.showClear && !widget.readOnly && widget.enabled) {
      //显示 清理按钮
      suffix = GestureDetector(
        onTap: onClear,
        child: Icon(
          Icons.cancel,
          size: 32.w,
          color: Colors.grey,
        ),
      );
    }

    InputDecoration inputDecoration = InputDecoration(
      filled: widget.filled,
      fillColor: widget.fillColor,
      border: border,
      enabledBorder: border,
      focusedBorder: border,
      disabledBorder: border,
      prefixIcon: prefixIcon,
      suffixIcon: suffixIcon,
      suffix: suffix,
      contentPadding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 0),
      hintText: widget.hintText,
      hintStyle: widget.hintStyle,
      //不显示字数限制
      counterText: '',
      isCollapsed: true,
    );
    return inputDecoration;
  }

  @override
  Widget build(BuildContext context) {
    InputDecoration inputDecoration = getDecoration();
    return TextField(
      decoration: inputDecoration,
      textAlignVertical: widget.textAlignVertical,
      maxLength: widget.maxLength,
      minLines: widget.minLines,
      maxLines: widget.maxLines,
      textAlign: widget.textAlign,
      obscureText: obscureText,
      readOnly: widget.readOnly,
      enabled: widget.enabled,
      controller: controller,
      onChanged: widget.onChanged,
      onEditingComplete: widget.onEditingComplete,
      onSubmitted: widget.onSubmitted,
      inputFormatters: widget.inputFormatters,
      keyboardType: widget.keyboardType,
      textInputAction: widget.textInputAction,
    );
  }

  //清除内容
  void onClear() {
    controller?.clear();
    if (widget.onChanged != null) {
      widget.onChanged('');
    }
  }

  //密码显示切换
  void toggleShowPwd() {
    obscureText = !obscureText;
    if (mounted) {
      setState(() {});
    }
  }
}
