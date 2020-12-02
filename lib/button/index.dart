import 'package:flutter/material.dart';
import 'package:voo/color/index.dart';

enum VooButtonTheme { normal, accent, capsule, text }

///按钮视图
class VooButton extends StatelessWidget {
  final Text child;
  final VooButtonTheme theme;
  final double elevation;
  final VoidCallback onPressed;
  final bool enable;

  VooButton({
    @required this.child,
    this.theme = VooButtonTheme.normal,
    this.elevation = 0.0,
    this.onPressed,
    this.enable = true,
  });

  @override
  Widget build(BuildContext context) {
    ShapeBorder shapeBorder;
    Widget childView;
    switch (theme) {
      case VooButtonTheme.normal:
        shapeBorder = RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(3.0)),
        );
        childView = DefaultTextStyle(child: child, style: TextStyle(fontSize: 12, color: Colors.white));
        return SizedBox(
          width: double.infinity,
          child: RaisedButton(
            shape: shapeBorder,
            child: childView,
            color: VooColors.accentColor,
            disabledColor: VooColors.accentColor.withOpacity(0.3),
            textColor: Colors.white,
            disabledTextColor: Colors.white.withOpacity(0.5),
            elevation: elevation,
            disabledElevation: elevation,
            onPressed: enable ? onPressed : null,
          ),
        );
      case VooButtonTheme.accent:
        shapeBorder = RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(3.0)),
          side: BorderSide(
            color: onPressed != null ? VooColors.accentColor : VooColors.accentColor.withOpacity(0.3),
            width: 1,
          ),
        );
        childView = DefaultTextStyle(
          child: child,
          style: TextStyle(
            fontSize: 12,
            color: onPressed != null ? VooColors.accentColor : VooColors.accentColor.withOpacity(0.3),
          ),
        );
        return SizedBox(
          width: double.infinity,
          child: RaisedButton(
            shape: shapeBorder,
            child: childView,
            color: Colors.white,
            disabledColor: Colors.white.withOpacity(0.3),
            textColor: VooColors.accentColor,
            disabledTextColor: VooColors.accentColor.withOpacity(0.5),
            elevation: elevation,
            disabledElevation: elevation,
            onPressed: enable ? onPressed : null,
          ),
        );
      case VooButtonTheme.capsule:
        shapeBorder = RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(18)),
        );
        childView = DefaultTextStyle(child: child, style: TextStyle(fontSize: 12, color: Colors.white));
        return SizedBox(
          width: double.infinity,
          child: RaisedButton(
            shape: shapeBorder,
            child: childView,
            color: VooColors.accentColor,
            disabledColor: VooColors.accentColor.withOpacity(0.3),
            textColor: Colors.white,
            disabledTextColor: Colors.white.withOpacity(0.5),
            elevation: elevation,
            disabledElevation: elevation,
            onPressed: enable ? onPressed : null,
          ),
        );
      case VooButtonTheme.text:
        childView = DefaultTextStyle(child: child, style: TextStyle(fontSize: 12, color: Colors.black));
        return SizedBox(
          width: double.infinity,
          child: FlatButton(
            onPressed: enable ? onPressed : null,
            child: childView,
          ),
        );
      default:
        return SizedBox.shrink();
    }
  }
}
