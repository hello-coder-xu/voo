import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//显示位置控制
enum VooToastPosition { top, center, bottom }

//显示类型
enum VooToastType { text, loading, result }

//操作类型
enum VooToastResult { success, fail, warn }

class VooToast {
  static Function showToast(
    BuildContext context, {
    String msg,
    int showTime = 2000,
    Color bgColor,
    Color textColor,
    double textSize = 14,
    VooToastPosition position = VooToastPosition.bottom,
    double pdHorizontal = 20,
    double pdVertical = 10,
  }) {
    return _showToast(
      context,
      msg: msg,
      showTime: showTime,
      bgColor: bgColor,
      textColor: textColor,
      textSize: textSize,
      position: position,
      pdHorizontal: pdHorizontal,
      pdVertical: pdVertical,
      type: VooToastType.text,
    );
  }

  static Function showLoading(
    BuildContext context, {
    String msg,
    Color bgColor,
    Color textColor,
    double pdHorizontal = 20,
    double pdVertical = 10,
    double textSize = 14,
  }) {
    return _showToast(
      context,
      msg: msg,
      bgColor: bgColor,
      textColor: textColor,
      textSize: textSize,
      pdHorizontal: pdHorizontal,
      pdVertical: pdVertical,
      type: VooToastType.loading,
    );
  }

  static Function showResult(
    BuildContext context, {
    String msg,
    Color bgColor,
    Color textColor,
    double pdHorizontal = 20,
    double pdVertical = 10,
    double textSize = 14,
    VooToastResult result = VooToastResult.success,
  }) {
    return _showToast(
      context,
      msg: msg,
      bgColor: bgColor,
      textColor: textColor,
      textSize: textSize,
      pdHorizontal: pdHorizontal,
      pdVertical: pdVertical,
      type: VooToastType.result,
      result: result,
    );
  }
}

Function _showToast(
  BuildContext context, {
  String msg,
  int showTime = 1000,
  Color bgColor,
  Color textColor,
  double textSize,
  VooToastPosition position = VooToastPosition.center,
  double pdHorizontal,
  double pdVertical,
  VooToastType type = VooToastType.text,
  VooToastResult result = VooToastResult.success,
}) {
  //获取OverlayState
  OverlayState overlayState = Overlay.of(context);

  GlobalKey<_FToastViewState> key = GlobalKey();

  OverlayEntry _overlayEntry = OverlayEntry(
      builder: (BuildContext context) => _FToastView(
            msg,
            key: key,
            bgColor: bgColor,
            textColor: textColor,
            textSize: textSize,
            toastPosition: position,
            pdHorizontal: pdHorizontal,
            pdVertical: pdVertical,
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
  final String msg;

  // 背景颜色
  final Color bgColor;

  // 文本颜色
  final Color textColor;

  // 文字大小
  final double textSize;

  // 显示位置
  final VooToastPosition toastPosition;

  // 左右边距
  final double pdHorizontal;

  // 上下边距
  final double pdVertical;

  //显示类型
  final VooToastType type;

  //结果类型
  final VooToastResult result;

  final VoidCallback close;

  _FToastView(
    this.msg, {
    Key key,
    this.bgColor,
    this.textColor,
    this.textSize,
    this.toastPosition,
    this.pdHorizontal,
    this.pdVertical,
    this.type,
    this.result,
    this.close,
  }) : super(key: key);

  @override
  _FToastViewState createState() => new _FToastViewState();
}

class _FToastViewState extends State<_FToastView> with SingleTickerProviderStateMixin {
  static const Duration _fadeInDuration = Duration(milliseconds: 150);
  static const Duration _fadeOutDuration = Duration(milliseconds: 75);
  AnimationController _controller;

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
      opacity: _controller,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 40),
        width: MediaQuery.of(context).size.width,
        alignment: Alignment.center,
        child: _buildToastWidget(),
      ),
    );
    if (widget.toastPosition == VooToastPosition.center || widget.type == VooToastType.loading) {
      return toastView;
    }
    return Positioned(
      top: buildToastPosition(context),
      child: toastView,
    );
  }

  //toast绘制
  _buildToastWidget() {
    if (widget.type == VooToastType.text) {
      return Center(
        child: Card(
          color: widget.bgColor ?? Theme.of(context).textTheme.headline6.color,
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: widget.pdHorizontal,
              vertical: widget.pdVertical,
            ),
            child: Text(
              widget.msg,
              style: TextStyle(fontSize: widget.textSize, color: widget.textColor ?? Colors.white),
            ),
          ),
        ),
      );
    } else if (widget.type == VooToastType.loading) {
      List<Widget> children = [];
      children.add(CircularProgressIndicator(
        strokeWidth: 3.0,
        valueColor: AlwaysStoppedAnimation(Colors.white),
      ));
      children.add(SizedBox(height: 8));
      children.add(Text(
        widget.msg,
        style: TextStyle(fontSize: widget.textSize, color: widget.textColor ?? Colors.white),
      ));
      return Center(
        child: Card(
          color: widget.bgColor ?? Theme.of(context).textTheme.headline6.color,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: widget.pdHorizontal, vertical: widget.pdVertical),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: children,
            ),
          ),
        ),
      );
    } else if (widget.type == VooToastType.result) {
      List<Widget> children = [];
      Widget iconView;
      switch (widget.result) {
        case VooToastResult.success:
          iconView = Icon(Icons.check_circle_outline, color: Colors.white, size: 24);
          break;
        case VooToastResult.fail:
          iconView = Icon(Icons.highlight_off, color: Colors.white, size: 24);
          break;
        case VooToastResult.warn:
          iconView = Icon(Icons.info_outline, color: Colors.white, size: 24);
          break;
      }
      children.add(iconView);
      children.add(SizedBox(height: 8));
      children.add(Text(
        widget.msg,
        style: TextStyle(fontSize: widget.textSize, color: widget.textColor ?? Colors.white),
      ));
      return Center(
        child: Card(
          color: widget.bgColor ?? Theme.of(context).textTheme.headline6.color,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: widget.pdHorizontal, vertical: widget.pdVertical),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: children,
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
      backResult = MediaQuery.of(context).size.height * 1 / 4;
    } else if (widget.toastPosition == VooToastPosition.center) {
      backResult = MediaQuery.of(context).size.height * 1 / 2;
    } else {
      backResult = MediaQuery.of(context).size.height * 3 / 4;
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
    _controller.dispose();
    super.dispose();
  }
}
