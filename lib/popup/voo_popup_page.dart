import 'package:flutter/material.dart';

class VooPopupPage extends PopupRoute {
  Duration _duration = Duration(milliseconds: 100);
  final Widget child;

  VooPopupPage({@required this.child, Duration duration}) {
    if (duration != null) {
      _duration = duration;
    }
  }

  @override
  Color get barrierColor => null;

  @override
  bool get barrierDismissible => true;

  @override
  String get barrierLabel => null;

  @override
  Widget buildPage(BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) {
    return child;
  }

  @override
  Duration get transitionDuration => _duration;
}
