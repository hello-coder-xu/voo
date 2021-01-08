import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class VooDialog {
  static Future showTextDialog({
    @required BuildContext context,
    bool barrierDismissible = true,
    Color barrierColor,
    bool useSafeArea = true,
    bool useRootNavigator = true,
    RouteSettings routeSettings,
    String title,
    Widget content,
    String confirm,
    String middle,
    String cancel,
    TextStyle confirmStyle,
    TextStyle middleStyle,
    TextStyle cancelStyle,
    VoidCallback onConfirm,
    VoidCallback onMiddle,
    VoidCallback onCancel,
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

  static Future showImageDialog({
    @required BuildContext context,
    bool barrierDismissible = true,
    Color barrierColor,
    bool useSafeArea = true,
    bool useRootNavigator = true,
    RouteSettings routeSettings,
    String title,
    Widget content,
    String confirm,
    String middle,
    String cancel,
    TextStyle confirmStyle,
    TextStyle middleStyle,
    TextStyle cancelStyle,
    VoidCallback onConfirm,
    VoidCallback onMiddle,
    VoidCallback onCancel,
    bool horizontal = true,
    Widget icon,
    bool fit = false,
    Widget closeIcon,
    VoidCallback close,
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

  static Future showOperationDialog({
    @required BuildContext context,
    bool barrierDismissible = true,
    Color barrierColor,
    bool useSafeArea = true,
    bool useRootNavigator = true,
    RouteSettings routeSettings,
    Widget child,
    VoidCallback close,
    EdgeInsets insetPadding,
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
  final String title;
  final TextStyle titleStyle;
  final Widget content;
  final String confirm;
  final TextStyle confirmStyle;
  final String middle;
  final TextStyle middleStyle;
  final String cancel;
  final TextStyle cancelStyle;
  final VoidCallback onConfirm;
  final VoidCallback onMiddle;
  final VoidCallback onCancel;
  final bool horizontal;

  VooTextDialog({
    this.title,
    this.titleStyle,
    @required this.content,
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
  final String title;
  final TextStyle titleStyle;
  final Widget content;
  final String confirm;
  final TextStyle confirmStyle;
  final String middle;
  final TextStyle middleStyle;
  final String cancel;
  final TextStyle cancelStyle;
  final VoidCallback onConfirm;
  final VoidCallback onMiddle;
  final VoidCallback onCancel;
  final bool horizontal;
  final Widget icon;
  final bool fit;
  final Widget closeIcon;
  final VoidCallback close;

  VooImageDialog({
    @required this.content,
    @required this.icon,
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
      margin: EdgeInsets.only(top: fit ? 0 : ScreenUtil().setWidth(40)),
      alignment: Alignment.center,
      child: icon,
    ));
    children.add(Positioned(
      top: ScreenUtil().setWidth(16),
      right: ScreenUtil().setWidth(16),
      child: GestureDetector(
        onTap: () => onCloseTap(context),
        child: closeIcon ?? Icon(Icons.close, size: ScreenUtil().setWidth(40)),
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
    if (close != null) close();
  }
}

///运营对话框
class VooOperatingDialog extends StatelessWidget {
  final Widget child;
  final VoidCallback close;
  final EdgeInsets insetPadding;

  VooOperatingDialog({
    @required this.child,
    this.close,
    this.insetPadding,
  });

  @override
  Widget build(BuildContext context) {
    List<Widget> children = [];

    children.add(Card(
      clipBehavior: Clip.antiAlias,
      child: Container(
        constraints: BoxConstraints(maxWidth: ScreenUtil().setWidth(638)),
        child: child,
      ),
      elevation: 0,
    ));
    children.add(SizedBox(height: ScreenUtil().setHeight(26)));
    children.add(GestureDetector(
      onTap: () => onCloseTap(context),
      child: Icon(
        Icons.clear_rounded,
        color: Colors.white,
        size: ScreenUtil().setWidth(64),
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
    if (close != null) close();
  }
}

class _VooDialog extends StatelessWidget {
  final String title;
  final TextStyle titleStyle;
  final Widget content;
  final String confirm;
  final TextStyle confirmStyle;
  final String middle;
  final TextStyle middleStyle;
  final String cancel;
  final TextStyle cancelStyle;
  final VoidCallback onConfirm;
  final VoidCallback onMiddle;
  final VoidCallback onCancel;
  final bool horizontal;

  _VooDialog({
    this.title,
    this.titleStyle,
    @required this.content,
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
      return Container(
          width: double.infinity, height: 0.5, color: Colors.grey[200]);
    }
  }

  //顶部视图
  Widget topView() {
    List<Widget> children = [];
    if (title != null) {
      children.add(Text(
        title,
        style: titleStyle ??
            TextStyle(
              fontSize: ScreenUtil().setSp(36),
              color: Color(0xff333333),
            ),
      ));
      children.add(SizedBox(height: ScreenUtil().setHeight(24)));
    }

    children.add(DefaultTextStyle(
      child: content,
      style: TextStyle(
        fontSize: ScreenUtil().setSp(28),
        color: title == null ? Color(0xff333333) : Color(0xff999999),
      ),
    ));
    return Container(
      padding: EdgeInsets.all(ScreenUtil().setWidth(40)),
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
            height: ScreenUtil().setHeight(90),
            alignment: Alignment.center,
            child: Text(
              cancel,
              style: cancelStyle ??
                  TextStyle(
                    fontSize: ScreenUtil().setSp(32),
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
            height: ScreenUtil().setHeight(90),
            alignment: Alignment.center,
            child: Text(
              middle,
              style: middleStyle ??
                  TextStyle(
                    fontSize: ScreenUtil().setSp(32),
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
          height: ScreenUtil().setHeight(90),
          alignment: Alignment.center,
          child: Text(
            confirm,
            style: middleStyle ??
                TextStyle(
                  fontSize: ScreenUtil().setSp(32),
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
      width: ScreenUtil().setWidth(560),
      child: Column(children: children),
    );
  }

  void onCancelTap(BuildContext context) {
    Navigator.pop(context);
    if (onCancel != null) onCancel();
  }

  void onMiddleTap(BuildContext context) {
    Navigator.pop(context);
    if (onMiddle != null) onMiddle();
  }

  void onConfirmTap(BuildContext context) {
    Navigator.pop(context);
    if (onConfirm != null) onConfirm();
  }
}
