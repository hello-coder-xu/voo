import 'package:flutter/material.dart';

///工具类
class VooUtil {
  static Future showTransparentPage(
    BuildContext context, {
    Widget child,
  }) {
    return Navigator.push(
      context,
      PageRouteBuilder(
        opaque: false,
        pageBuilder: (context, animation, secondaryAnimation) => child,
      ),
    );
  }
}
