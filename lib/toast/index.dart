import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

//显示位置控制
enum VooToastPosition { top, center, bottom }

//显示类型
enum VooToastType { text, loading, result }

//操作类型
enum VooToastResult { success, fail, warn }

class VooToast {
  static Function showToast(
    BuildContext context, {
    String? msg,
    int showTime = 2000,
    Color? bgColor,
    TextStyle? textStyle,
    VooToastPosition position = VooToastPosition.bottom,
  }) {
    return _showToast(
      context,
      msg: msg,
      showTime: showTime,
      bgColor: bgColor,
      textStyle: textStyle,
      position: position,
      type: VooToastType.text,
    );
  }

  static Function showLoading(
    BuildContext context, {
    String? msg,
    Color? bgColor,
    TextStyle? textStyle,
  }) {
    return _showToast(
      context,
      msg: msg,
      bgColor: bgColor,
      textStyle: textStyle,
      type: VooToastType.loading,
    );
  }

  static Function showResult(
    BuildContext context, {
    String? msg,
    Color? bgColor,
    TextStyle? textStyle,
    VooToastResult result = VooToastResult.success,
  }) {
    return _showToast(
      context,
      msg: msg,
      bgColor: bgColor,
      textStyle: textStyle,
      type: VooToastType.result,
      result: result,
    );
  }
}

Function _showToast(
  BuildContext context, {
  String? msg,
  int showTime = 1000,
  Color? bgColor,
  TextStyle? textStyle,
  VooToastPosition position = VooToastPosition.center,
  VooToastType type = VooToastType.text,
  VooToastResult result = VooToastResult.success,
}) {
  //获取OverlayState
  OverlayState? overlayState = Overlay.of(context);

  GlobalKey<_FToastViewState> key = GlobalKey();

  OverlayEntry _overlayEntry = OverlayEntry(
      builder: (BuildContext context) => _FToastView(
            msg,
            key: key,
            bgColor: bgColor,
            textStyle: textStyle,
            toastPosition: position,
            type: type,
            result: result,
          ));
  //插入到整个布局的最上层
  overlayState?.insert(_overlayEntry);

  if (type == VooToastType.text) {
    Future.delayed(Duration(milliseconds: showTime), () {
      key.currentState?._hide();
      _overlayEntry.remove();
    });
  }

  return () {
    key.currentState?._hide();
    _overlayEntry.remove();
  };
}

class _FToastView extends StatefulWidget {
  // 提示内容
  final String? msg;

  // 背景颜色
  final Color? bgColor;

  // 文本颜色
  final TextStyle? textStyle;

  // 显示位置
  final VooToastPosition? toastPosition;

  //显示类型
  final VooToastType? type;

  //结果类型
  final VooToastResult result;

  final VoidCallback? close;

  _FToastView(
    this.msg, {
    Key? key,
    this.bgColor,
    this.textStyle,
    this.toastPosition,
    this.type,
    this.result = VooToastResult.success,
    this.close,
  }) : super(key: key);

  @override
  _FToastViewState createState() => new _FToastViewState();
}

class _FToastViewState extends State<_FToastView>
    with SingleTickerProviderStateMixin {
  static const Duration _fadeInDuration = Duration(milliseconds: 150);
  static const Duration _fadeOutDuration = Duration(milliseconds: 75);
  AnimationController? _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: _fadeInDuration,
      reverseDuration: _fadeOutDuration,
      vsync: this,
    );
    _show();
  }

  @override
  Widget build(BuildContext context) {
    Widget toastView = FadeTransition(
      opacity: _controller!,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 40),
        width: MediaQuery.of(context).size.width,
        alignment: Alignment.center,
        child: _buildToastWidget(),
      ),
    );
    if (widget.toastPosition == VooToastPosition.center ||
        widget.type == VooToastType.loading) {
      return toastView;
    }
    return Positioned(
      top: buildToastPosition(context),
      child: toastView,
    );
  }

  //toast绘制
  _buildToastWidget() {
    Color tempBgColor = widget.bgColor ?? Color(0x70000000);
    TextStyle tempStyle =
        widget.textStyle ?? TextStyle(color: Colors.white, fontSize: 28.w);
    BorderRadius tempBorderRadius = BorderRadius.horizontal(
      left: Radius.circular(20.w),
      right: Radius.circular(20.w),
    );
    if (widget.type == VooToastType.text) {
      return Card(
        color: tempBgColor,
        shape: RoundedRectangleBorder(borderRadius: tempBorderRadius),
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 46.w,
            vertical: 22.w,
          ),
          child: Text(widget.msg!, style: tempStyle),
        ),
      );
    } else if (widget.type == VooToastType.loading) {
      List<Widget> children = [];
      children.add(SizedBox(
        width: 64.w,
        height: 64.w,
        child: CircularProgressIndicator(
          strokeWidth: 3.0,
          valueColor: AlwaysStoppedAnimation(Colors.white),
        ),
      ));
      children.add(SizedBox(height: 28.w));
      children.add(Text(widget.msg!, style: tempStyle));
      return Card(
        color: tempBgColor,
        shape: RoundedRectangleBorder(borderRadius: tempBorderRadius),
        child: Container(
          width: 240.w,
          height: 240.w,
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(
            horizontal: 46.w,
            vertical: 46.w,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: children,
          ),
        ),
      );
    } else if (widget.type == VooToastType.result) {
      List<Widget?> children = [];
      Widget? iconView;
      switch (widget.result) {
        case VooToastResult.success:
          iconView = Icon(
            Icons.check_circle_outline,
            color: Colors.white,
            size: 64.w,
          );
          break;
        case VooToastResult.fail:
          iconView = Icon(
            Icons.highlight_off,
            color: Colors.white,
            size: 64.w,
          );
          break;
        case VooToastResult.warn:
          iconView = Icon(
            Icons.info_outline,
            color: Colors.white,
            size: 64.w,
          );
          break;
      }
      children.add(iconView);
      children.add(SizedBox(height: 28.w));
      children.add(Text(widget.msg!, style: tempStyle));
      return Center(
        child: Card(
          color: tempBgColor,
          child: Container(
            width: 240.w,
            height: 240.w,
            alignment: Alignment.center,
            padding: EdgeInsets.symmetric(
              horizontal: 46.w,
              vertical: 46.w,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: children as List<Widget>,
            ),
          ),
        ),
      );
    }
  }

  //  设置toast位置
  buildToastPosition(context) {
    var backResult;
    if (widget.toastPosition == VooToastPosition.top) {
      backResult = ScreenUtil().screenHeight * 1 / 4;
    } else if (widget.toastPosition == VooToastPosition.center) {
      backResult = ScreenUtil().screenHeight * 1 / 2;
    } else {
      backResult = ScreenUtil().screenHeight * 3 / 4;
    }
    return backResult;
  }

  //显示
  void _show() {
    _controller?.forward();
  }

  //隐藏
  void _hide() {
    _controller?.reverse();
  }

  @override
  void dispose() {
    _hide();
    _controller!.dispose();
    super.dispose();
  }
}
