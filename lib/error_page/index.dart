import 'package:flutter/material.dart';

enum VooErrorType { empty_comment, empty_data, net_error, sys_error }

///异常页面
class VooError extends StatelessWidget {
  final VooErrorType type;
  final Widget title;
  final Widget child;

  VooError({this.type = VooErrorType.empty_data, this.title, this.child});

  @override
  Widget build(BuildContext context) {
    List<Widget> children = [];
    Widget temp;
    switch (type) {
      case VooErrorType.empty_comment:
        temp = Image.asset('assets/error_page/empty_comment.png', package: 'voo');
        break;
      case VooErrorType.empty_data:
        temp = Image.asset('assets/error_page/empty_data.png', package: 'voo');
        break;
      case VooErrorType.net_error:
        temp = Image.asset('assets/error_page/net_error.png', package: 'voo');
        break;
      case VooErrorType.sys_error:
        temp = Image.asset('assets/error_page/sys_error.png', package: 'voo');
        break;
      default:
        temp = SizedBox.shrink();
        break;
    }
    children.add(child ?? temp);
    if (title != null) {
      children.add(title);
    }
    return Column(children: children);
  }
}
