import 'package:flutter/material.dart';

enum VooPopupType { top, left, right, bottom, none }

///popup
class VooPopup {
  static Future showPopup({
    required BuildContext context,
    required WidgetBuilder builder,
    bool barrierDismissible = true,
    Color? barrierColor,
    bool useSafeArea = true,
    bool useRootNavigator = true,
    RouteSettings? routeSettings,
    VooPopupType type = VooPopupType.none,
  }) {
    assert(debugCheckHasMaterialLocalizations(context));

    final ThemeData theme = Theme.of(context);
    return showGeneralDialog(
      context: context,
      pageBuilder: (BuildContext buildContext, Animation<double> animation,
          Animation<double> secondaryAnimation) {
        final Widget pageChild = Builder(builder: builder);
        Widget dialog = Builder(builder: (BuildContext context) {
          return Theme(data: theme, child: pageChild);
        });

        AlignmentGeometry alignment;
        switch (type) {
          case VooPopupType.left:
            alignment = Alignment.centerLeft;
            break;
          case VooPopupType.top:
            alignment = Alignment.topCenter;
            break;
          case VooPopupType.right:
            alignment = Alignment.centerRight;
            break;
          case VooPopupType.bottom:
            alignment = Alignment.bottomCenter;
            break;
          default:
            alignment = Alignment.center;
            break;
        }

        dialog = Container(
          constraints: const BoxConstraints(minWidth: 280.0),
          alignment: alignment,
          child: dialog,
        );

        dialog = MediaQuery.removeViewInsets(
          removeLeft: true,
          removeTop: true,
          removeRight: true,
          removeBottom: true,
          context: context,
          child: dialog,
        );

        if (useSafeArea) {
          dialog = SafeArea(child: dialog);
        }
        return dialog;
      },
      barrierDismissible: barrierDismissible,
      barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
      barrierColor: barrierColor ?? Colors.black54,
      transitionDuration: const Duration(milliseconds: 400),
      transitionBuilder: (BuildContext context,
          Animation<double> primaryRouteAnimation,
          Animation<double> secondaryRouteAnimation,
          Widget child) {
        Tween tween;
        switch (type) {
          case VooPopupType.left:
            tween =
                Tween<Offset>(begin: Offset(-1.0, 0.0), end: Offset(0.0, 0.0));
            break;
          case VooPopupType.top:
            tween =
                Tween<Offset>(begin: Offset(0.0, -1), end: Offset(0.0, 0.0));
            break;
          case VooPopupType.right:
            tween =
                Tween<Offset>(begin: Offset(1.0, 0.0), end: Offset(0.0, 0.0));
            break;
          case VooPopupType.bottom:
            tween =
                Tween<Offset>(begin: Offset(0.0, 1.0), end: Offset(0.0, 0.0));
            break;
          default:
            tween = Tween<double>(begin: 0.5, end: 1.0);
            break;
        }
        Animation animation = tween.animate(CurvedAnimation(
          parent: primaryRouteAnimation,
          curve: Curves.linearToEaseOut,
        ));
        if (type == VooPopupType.none) {
          return FadeTransition(
              opacity: animation as Animation<double>,
              child: ScaleTransition(scale: animation, child: child));
        } else {
          return SlideTransition(
              position: animation as Animation<Offset>, child: child);
        }
      },
      useRootNavigator: useRootNavigator,
      routeSettings: routeSettings,
    );
  }
}
