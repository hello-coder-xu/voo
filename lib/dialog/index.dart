import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class VooDialog {
  ///对话框-文本
  static Future showTextDialog({
    required BuildContext context,
    bool barrierDismissible = true,
    Color barrierColor = Colors.black54,
    bool useSafeArea = true,
    bool useRootNavigator = true,
    RouteSettings? routeSettings,
    String? title,
    Widget? content,
    String? confirm,
    String? middle,
    String? cancel,
    TextStyle? confirmStyle,
    TextStyle? middleStyle,
    TextStyle? cancelStyle,
    VoidCallback? onConfirm,
    VoidCallback? onMiddle,
    VoidCallback? onCancel,
    bool horizontal = true,
  }) {
    WidgetBuilder builder = (context) => VooTextDialog(
          title: title,
          content: content,
          middle: middle,
          cancel: cancel,
          confirm: confirm,
          onMiddle: onMiddle,
          onCancel: onCancel,
          onConfirm: onConfirm,
          confirmStyle: confirmStyle,
          middleStyle: middleStyle,
          cancelStyle: cancelStyle,
          horizontal: horizontal,
        );
    return showDialog(
      context: context,
      builder: builder,
      barrierDismissible: barrierDismissible,
      barrierColor: barrierColor,
      useSafeArea: useSafeArea,
      useRootNavigator: useRootNavigator,
      routeSettings: routeSettings,
    );
  }

  ///对话框-图片
  static Future showImageDialog({
    required BuildContext context,
    bool barrierDismissible = true,
    Color barrierColor = Colors.black54,
    bool useSafeArea = true,
    bool useRootNavigator = true,
    RouteSettings? routeSettings,
    String? title,
    Widget? content,
    String? confirm,
    String? middle,
    String? cancel,
    TextStyle? confirmStyle,
    TextStyle? middleStyle,
    TextStyle? cancelStyle,
    VoidCallback? onConfirm,
    VoidCallback? onMiddle,
    VoidCallback? onCancel,
    bool horizontal = true,
    Widget? icon,
    bool fit = false,
    Widget? closeIcon,
    VoidCallback? close,
  }) {
    WidgetBuilder builder = (context) => VooImageDialog(
          title: title,
          content: content,
          confirm: confirm,
          middle: middle,
          cancel: cancel,
          confirmStyle: confirmStyle,
          middleStyle: middleStyle,
          cancelStyle: cancelStyle,
          onConfirm: onConfirm,
          onMiddle: onMiddle,
          onCancel: onCancel,
          horizontal: horizontal,
          icon: icon,
          fit: fit,
          closeIcon: closeIcon,
          close: close,
        );
    return showDialog(
      context: context,
      builder: builder,
      barrierDismissible: barrierDismissible,
      barrierColor: barrierColor,
      useSafeArea: useSafeArea,
      useRootNavigator: useRootNavigator,
      routeSettings: routeSettings,
    );
  }

  ///对话框-运营
  static Future showOperationDialog({
    required BuildContext context,
    bool barrierDismissible = true,
    Color barrierColor = Colors.black54,
    bool useSafeArea = true,
    bool useRootNavigator = true,
    RouteSettings? routeSettings,
    Widget? child,
    VoidCallback? close,
    EdgeInsets? insetPadding,
  }) {
    WidgetBuilder builder = (context) => VooOperatingDialog(
          child: child,
          insetPadding: insetPadding,
          close: close,
        );
    return showDialog(
      context: context,
      builder: builder,
      barrierDismissible: barrierDismissible,
      barrierColor: barrierColor,
      useSafeArea: useSafeArea,
      useRootNavigator: useRootNavigator,
      routeSettings: routeSettings,
    );
  }
}

///文本对话框
class VooTextDialog extends StatelessWidget {
  //标题
  final String? title;

  //标题文本字体样式
  final TextStyle? titleStyle;

  //内容视图
  final Widget? content;

  //确定文本
  final String? confirm;

  //确定字体样式
  final TextStyle? confirmStyle;

  //中间按钮文本
  final String? middle;

  //中间文本字体样式
  final TextStyle? middleStyle;

  //取消文本
  final String? cancel;

  //取消字体样式
  final TextStyle? cancelStyle;

  //确定事件
  final VoidCallback? onConfirm;

  //中间按钮事件
  final VoidCallback? onMiddle;

  //取消事件
  final VoidCallback? onCancel;

  //是否水平显示
  final bool horizontal;

  VooTextDialog({
    this.title,
    this.titleStyle,
    required this.content,
    this.confirm,
    this.middle,
    this.cancel,
    this.onConfirm,
    this.onMiddle,
    this.onCancel,
    this.confirmStyle,
    this.middleStyle,
    this.cancelStyle,
    this.horizontal = true,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: EdgeInsets.zero,
      content: IntrinsicHeight(
        child: _VooDialog(
          content: content,
          title: title,
          titleStyle: titleStyle,
          cancel: cancel,
          middle: middle,
          confirm: confirm,
          onCancel: onCancel,
          onMiddle: onMiddle,
          onConfirm: onConfirm,
          cancelStyle: cancelStyle,
          middleStyle: middleStyle,
          confirmStyle: confirmStyle,
          horizontal: horizontal,
        ),
      ),
    );
  }
}

///图片对话框
class VooImageDialog extends StatelessWidget {
  //标题
  final String? title;

  //标题字体样式
  final TextStyle? titleStyle;

  //内容视图
  final Widget? content;

  //确定按钮文本
  final String? confirm;

  //确定字体样式
  final TextStyle? confirmStyle;

  //中间按钮文本
  final String? middle;

  //中间字体样式
  final TextStyle? middleStyle;

  //取消按钮文本
  final String? cancel;

  //取消字体样式
  final TextStyle? cancelStyle;

  //确定事件
  final VoidCallback? onConfirm;

  //中间按钮事件
  final VoidCallback? onMiddle;

  //取消事件
  final VoidCallback? onCancel;

  //是否水平显示
  final bool horizontal;

  //内容中图标视图
  final Widget? icon;

  //是否全部填充
  final bool fit;

  //关闭按钮
  final Widget? closeIcon;

  //关闭按钮事件
  final VoidCallback? close;

  VooImageDialog({
    required this.content,
    required this.icon,
    this.title,
    this.titleStyle,
    this.confirm,
    this.middle,
    this.cancel,
    this.onConfirm,
    this.onMiddle,
    this.onCancel,
    this.confirmStyle,
    this.middleStyle,
    this.cancelStyle,
    this.horizontal = true,
    this.fit = false,
    this.closeIcon,
    this.close,
  });

  Widget topView(BuildContext context) {
    List<Widget> children = [];
    children.add(Container(
      margin: EdgeInsets.only(top: fit ? 0 : 40.w),
      alignment: Alignment.center,
      child: icon,
    ));
    children.add(Positioned(
      top: 16.w,
      right: 16.w,
      child: GestureDetector(
        onTap: () => onCloseTap(context),
        child: closeIcon ?? Icon(Icons.close, size: 40.w),
      ),
    ));
    return Stack(fit: StackFit.passthrough, children: children);
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> children = [];
    children.add(topView(context));
    children.add(_VooDialog(
      content: content,
      title: title,
      titleStyle: titleStyle,
      cancel: cancel,
      middle: middle,
      confirm: confirm,
      cancelStyle: cancelStyle,
      middleStyle: middleStyle,
      confirmStyle: confirmStyle,
      onCancel: onCancel,
      onMiddle: onMiddle,
      onConfirm: onConfirm,
      horizontal: horizontal,
    ));

    return AlertDialog(
      contentPadding: EdgeInsets.zero,
      clipBehavior: Clip.antiAlias,
      content: IntrinsicHeight(
        child: Column(
          children: children,
          mainAxisSize: MainAxisSize.min,
        ),
      ),
    );
  }

  void onCloseTap(BuildContext context) {
    Navigator.pop(context);
    if (close != null) close!();
  }
}

///运营对话框
class VooOperatingDialog extends StatelessWidget {
  //内容视图
  final Widget? child;

  //关闭事件
  final VoidCallback? close;

  //内部间距
  final EdgeInsets? insetPadding;

  VooOperatingDialog({
    required this.child,
    this.close,
    this.insetPadding,
  });

  @override
  Widget build(BuildContext context) {
    List<Widget> children = [];

    children.add(Card(
      clipBehavior: Clip.antiAlias,
      child: Container(
        constraints: BoxConstraints(maxWidth: 638.w),
        child: child,
      ),
      elevation: 0,
    ));
    children.add(SizedBox(height: 26.h));
    children.add(GestureDetector(
      onTap: () => onCloseTap(context),
      child: Icon(
        Icons.clear_rounded,
        color: Colors.white,
        size: 64.w,
      ),
    ));

    return Dialog(
      backgroundColor: Colors.transparent,
      elevation: 0,
      insetPadding: insetPadding ?? EdgeInsets.symmetric(horizontal: 0),
      child: IntrinsicHeight(
        child: Column(children: children),
      ),
    );
  }

  void onCloseTap(BuildContext context) {
    Navigator.pop(context);
    if (close != null) close!();
  }
}

class _VooDialog extends StatelessWidget {
  final String? title;
  final TextStyle? titleStyle;
  final Widget? content;
  final String? confirm;
  final TextStyle? confirmStyle;
  final String? middle;
  final TextStyle? middleStyle;
  final String? cancel;
  final TextStyle? cancelStyle;
  final VoidCallback? onConfirm;
  final VoidCallback? onMiddle;
  final VoidCallback? onCancel;
  final bool horizontal;

  _VooDialog({
    this.title,
    this.titleStyle,
    required this.content,
    this.confirm,
    this.middle,
    this.cancel,
    this.confirmStyle,
    this.middleStyle,
    this.cancelStyle,
    this.onConfirm,
    this.onMiddle,
    this.onCancel,
    this.horizontal = true,
  });

  //分割线
  Widget dividerView({bool tempHorizontal = true}) {
    if (tempHorizontal) {
      return Container(width: 0.5, height: 40, color: Colors.grey[200]);
    } else {
      return Container(width: double.infinity, height: 0.5, color: Colors.grey[200]);
    }
  }

  //顶部视图
  Widget topView() {
    List<Widget> children = [];
    if (title != null) {
      children.add(Text(
        title!,
        style: titleStyle ??
            TextStyle(
              fontSize: 36.sp,
              color: Color(0xff333333),
            ),
      ));
      children.add(SizedBox(height: 24.h));
    }

    children.add(DefaultTextStyle(
      child: content!,
      style: TextStyle(
        fontSize: 28.sp,
        color: title == null ? Color(0xff333333) : Color(0xff999999),
      ),
    ));
    return Container(
      padding: EdgeInsets.all(40.w),
      alignment: Alignment.center,
      child: Column(children: children),
    );
  }

  //底部视图
  Widget bottomView(BuildContext context) {
    List<Widget> children = [];

    if (cancel != null) {
      children.add(Expanded(
        child: GestureDetector(
          onTap: () => onCancelTap(context),
          behavior: HitTestBehavior.opaque,
          child: Container(
            height: 90.h,
            alignment: Alignment.center,
            child: Text(
              cancel!,
              style: cancelStyle ??
                  TextStyle(
                    fontSize: 32.sp,
                    color: Color(0xff999999),
                  ),
            ),
          ),
        ),
      ));

      children.add(dividerView(tempHorizontal: horizontal));
    }
    if (middle != null) {
      children.add(Expanded(
        child: GestureDetector(
          onTap: () => onMiddleTap(context),
          behavior: HitTestBehavior.opaque,
          child: Container(
            height: 90.h,
            alignment: Alignment.center,
            child: Text(
              middle!,
              style: middleStyle ??
                  TextStyle(
                    fontSize: 32.sp,
                    color: Color(0xff999999),
                  ),
            ),
          ),
        ),
      ));

      children.add(dividerView(tempHorizontal: horizontal));
    }

    children.add(Expanded(
      child: GestureDetector(
        onTap: () => onConfirmTap(context),
        behavior: HitTestBehavior.opaque,
        child: Container(
          height: 90.h,
          alignment: Alignment.center,
          child: Text(
            confirm!,
            style: middleStyle ??
                TextStyle(
                  fontSize: 32.sp,
                  color: Color(0xff25c489),
                ),
          ),
        ),
      ),
    ));

    if (horizontal) {
      return Row(children: children);
    } else {
      return IntrinsicHeight(
        child: Column(children: children.reversed.toList()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> children = [];
    children.add(topView());
    children.add(dividerView(tempHorizontal: false));
    children.add(bottomView(context));
    return Container(
      width: 560.w,
      child: Column(children: children),
    );
  }

  void onCancelTap(BuildContext context) {
    Navigator.pop(context);
    if (onCancel != null) onCancel!();
  }

  void onMiddleTap(BuildContext context) {
    Navigator.pop(context);
    if (onMiddle != null) onMiddle!();
  }

  void onConfirmTap(BuildContext context) {
    Navigator.pop(context);
    if (onConfirm != null) onConfirm!();
  }
}
