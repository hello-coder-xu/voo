import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:voo/icon/index.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

enum TextFieldStyle {
  none,//无边框
  border,//有边框
}

///输入框
class VooTextField extends StatefulWidget {
  //显示样式
  final TextFieldStyle style;
  //前缀视图
  final Widget? prefixIcon;
  //提示文本
  final String? hintText;
  //后缀视图
  final Widget? suffixIcon;
  //文本字体样式
  final TextStyle textStyle;
  //提示文本字体样式
  final TextStyle hintStyle;
  //对齐方式
  final TextAlign textAlign;
  //垂直对齐方式
  final TextAlignVertical textAlignVertical;
  //是否填充
  final bool filled;
  //填充样式
  final Color fillColor;
  //边框颜色
  final Color borderColor;
  //边框宽度
  final double borderWidth;
  //边框圆角
  final BorderRadius borderRadius;
  //是否密码
  final bool showPwd;
  //是否显示清理按钮
  final bool showClear;
  //最大行数
  final int maxLines;
  //最小行数
  final int? minLines;
  //最大字数
  final int? maxLength;
  //是否只读
  final bool readOnly;
  //是否可用
  final bool enabled;
  //文本变化事件
  final ValueChanged<String>? onChanged;
  //软键盘完成事件
  final VoidCallback? onEditingComplete;
  //软键盘提交事件
  final ValueChanged<String>? onSubmitted;
  //输入框内容限制
  final List<TextInputFormatter>? inputFormatters;
  //软键盘显示样式
  final TextInputType? keyboardType;
  //软键盘按钮
  final TextInputAction? textInputAction;
  //控制器
  final TextEditingController? controller;

  VooTextField({
    this.style = TextFieldStyle.none,
    this.prefixIcon,
    this.hintText,
    this.suffixIcon,
    this.textStyle = const TextStyle(fontSize: 14, color: Colors.black87),
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
  TextEditingController? controller;
  late bool obscureText;

  @override
  void initState() {
    super.initState();
    controller = widget.controller ?? TextEditingController();
    obscureText = widget.showPwd;
  }

  /// 获取装饰
  InputDecoration getDecoration() {
    InputBorder? border;
    switch (widget.style) {
      case TextFieldStyle.none:
        border = OutlineInputBorder(
          borderRadius: BorderRadius.zero,
          borderSide: BorderSide(
            color: Colors.transparent,
            width: 0,
          ),
        );
        break;
      case TextFieldStyle.border:
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
    Widget? prefixIcon = widget.prefixIcon;
    Widget? suffixIcon;
    Widget? suffix;
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
      widget.onChanged!('');
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
