import 'package:flutter/material.dart';

///通知
class VooNotify {
  static VooNotifyOperation toastView;
  static var controller;
  static var offsetAnim;

  ///显示
  static Function show(
    BuildContext context, {
    @required Widget child,
    Duration duration = const Duration(seconds: 3),
    bool isAsync = false,
    bool ignoring = true,
  }) {
    var overlayState = Overlay.of(context);

    _addAnimation(overlayState);

    OverlayEntry overlayEntry = OverlayEntry(builder: (BuildContext context) {
      return AnimatedBuilder(
        animation: offsetAnim,
        builder: (context, _) {
          return Transform.translate(
            offset: Offset(0, offsetAnim.value),
            child: _buildToastLayout(child, ignoring: ignoring),
          );
        },
      );
    });
    toastView = VooNotifyOperation(
      overlayEntry: overlayEntry,
      overlayState: overlayState,
      controller: controller,
      duration: duration,
    );

    toastView.show();

    return toastView.hide;
  }

  ///构建要显示的toast的view
  static LayoutBuilder _buildToastLayout(Widget child, {bool ignoring = true}) {
    return LayoutBuilder(builder: (context, constraints) {
      return IgnorePointer(
        ignoring: ignoring,
        child: Container(
          child: Material(
            color: Colors.transparent,
            child: Container(child: child),
          ),
          alignment: Alignment.topCenter,
        ),
      );
    });
  }

  ///给overlayState添加动画
  static void _addAnimation(OverlayState overlayState) {
    controller = AnimationController(
      vsync: overlayState,
      duration: Duration(milliseconds: 350),
      reverseDuration: Duration(milliseconds: 250),
    );
    offsetAnim = Tween(begin: -100.0, end: 0.0).animate(controller);
  }
}

class VooNotifyOperation {
  AnimationController controller;
  OverlayEntry overlayEntry;
  OverlayState overlayState;
  bool isHide = false;
  Duration duration;
  bool isAsync;

  VooNotifyOperation({
    this.overlayEntry,
    this.overlayState,
    this.controller,
    this.duration = const Duration(seconds: 3),
    this.isAsync = false,
  });

  /*显示 延迟3.5秒 消失*/
  show() async {
    overlayState.insert(overlayEntry);

    controller.forward();
    if (!isAsync) {
      await Future.delayed(duration);
      hide();
    }
  }

  /*消失*/
  void hide() async {
    if (isHide) {
      return;
    }
    this.isHide = true;
    await controller.reverse();
    overlayEntry.remove();
  }
}
