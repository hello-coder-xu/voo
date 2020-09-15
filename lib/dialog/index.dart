import 'package:flutter/material.dart';
import 'package:voo/color/index.dart';

///文本对话框
class VooDialog extends StatelessWidget {
  final String title;
  final Widget content;
  final Widget confirm;
  final Widget middle;
  final Widget cancel;
  final VoidCallback onConfirm;
  final VoidCallback onMiddle;
  final VoidCallback onCancel;
  final bool horizontal;

  VooDialog({
    this.title,
    @required this.content,
    this.confirm,
    this.middle,
    this.cancel,
    this.onConfirm,
    this.onMiddle,
    this.onCancel,
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
          cancel: cancel,
          middle: middle,
          confirm: confirm,
          onCancel: onCancel,
          onMiddle: onMiddle,
          onConfirm: onConfirm,
          horizontal: horizontal,
        ),
      ),
    );
  }
}

///图片对话框
class VooImageDialog extends StatelessWidget {
  final String title;
  final Widget content;
  final Widget confirm;
  final Widget middle;
  final Widget cancel;
  final VoidCallback onConfirm;
  final VoidCallback onMiddle;
  final VoidCallback onCancel;
  final bool horizontal;
  final Widget icon;
  final bool fit;
  final Widget closeIcon;
  final VoidCallback close;

  VooImageDialog({
    this.title,
    @required this.content,
    this.confirm,
    this.middle,
    this.cancel,
    this.onConfirm,
    this.onMiddle,
    this.onCancel,
    this.horizontal = true,
    @required this.icon,
    this.fit = false,
    this.closeIcon,
    this.close,
  });

  Widget topView(BuildContext context) {
    List<Widget> children = [];

    children.add(Container(
      width: double.infinity,
      margin: EdgeInsets.only(top: fit ? 0 : 28),
      alignment: Alignment.center,
      child: icon,
    ));
    children.add(Positioned(
      top: 8,
      right: 8,
      child: GestureDetector(
        onTap: () => onCloseTap(context),
        child: closeIcon ?? Icon(Icons.close, size: 20),
      ),
    ));
    return Stack(
      fit: StackFit.passthrough,
      children: children,
    );
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> children = [];
    children.add(topView(context));
    children.add(_VooDialog(
      content: content,
      title: title,
      cancel: cancel,
      middle: middle,
      confirm: confirm,
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
    this.insetPadding = const EdgeInsets.symmetric(horizontal: 16),
  });

  @override
  Widget build(BuildContext context) {
    List<Widget> children = [];

    children.add(Card(
      clipBehavior: Clip.antiAlias,
      child: child,
      elevation: 0,
    ));
    children.add(SizedBox(height: 16));
    children.add(GestureDetector(
      onTap: () => onCloseTap(context),
      child: Icon(Icons.highlight_off, color: Colors.white, size: 30),
    ));

    return Dialog(
      backgroundColor: Colors.transparent,
      elevation: 0,
      insetPadding: insetPadding,
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
  final Widget content;
  final Widget confirm;
  final Widget middle;
  final Widget cancel;
  final VoidCallback onConfirm;
  final VoidCallback onMiddle;
  final VoidCallback onCancel;
  final bool horizontal;

  _VooDialog({
    this.title,
    @required this.content,
    this.confirm,
    this.middle,
    this.cancel,
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
      return Divider(height: 1, color: Colors.grey[200]);
    }
  }

  //顶部视图
  Widget topView() {
    List<Widget> children = [];
    if (title != null) {
      children.add(Text(title, style: TextStyle(fontSize: 16, color: VooColors.titleColor)));
      children.add(SizedBox(height: 8));
    }

    children.add(DefaultTextStyle(
      child: content,
      style: TextStyle(fontSize: 14, color: title == null ? VooColors.titleColor : VooColors.subTitleColor),
    ));
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 32),
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
            height: 40,
            alignment: Alignment.center,
            child: DefaultTextStyle(
              child: cancel,
              style: TextStyle(fontSize: 14, color: VooColors.subTitleColor),
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
            height: 40,
            alignment: Alignment.center,
            child: DefaultTextStyle(
              child: middle,
              style: TextStyle(fontSize: 14, color: VooColors.accentColor),
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
          height: 40,
          alignment: Alignment.center,
          child: DefaultTextStyle(
            child: confirm ?? Text('确定'),
            style: TextStyle(fontSize: 14, color: VooColors.accentColor),
          ),
        ),
      ),
    ));

    if (horizontal) {
      return Container(height: 40, child: Row(children: children));
    } else {
      return IntrinsicHeight(child: Column(children: children.reversed.toList()));
    }
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> children = [];
    children.add(topView());
    children.add(dividerView(tempHorizontal: false));
    children.add(bottomView(context));
    return Column(children: children);
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
