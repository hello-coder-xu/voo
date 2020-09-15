import 'package:flutter/material.dart';

enum VooErrorType { empty_comment, empty_data, net_error, sys_error }

///异常页面
class VooError extends StatelessWidget {
  final VooErrorType type;

  VooError({this.type = VooErrorType.empty_data});

  @override
  Widget build(BuildContext context) {
    switch (type) {
      case VooErrorType.empty_comment:
        return Image.asset('assets/error_page/empty-comment.png', package: 'voo');
      case VooErrorType.empty_data:
        return Image.asset('assets/error_page/empty-data.png', package: 'voo');
      case VooErrorType.net_error:
        return Image.asset('assets/error_page/net-error.png', package: 'voo');
      case VooErrorType.sys_error:
        return Image.asset('assets/error_page/sys-error.png', package: 'voo');
      default:
        return SizedBox.shrink();
    }
  }
}
