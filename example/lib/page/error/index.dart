import 'package:voo/error_page/index.dart';

import '../../comm/ui_component.dart';
import 'package:flutter/material.dart';

///异常页面
class ErrorPage extends StatelessWidget {
  //内容视图
  Widget contentView() {
    List<Widget> children = [];

    children.add(VooError(
      type: VooErrorType.net_error,
      title: Text('网络异常'),
    ));

    children.add(VooError(
      child: Image.network(
        'https://img1.8591.com.hk/images/goods/20200702/BAAKpoAXfqsZiaZfpGhaUgxjM4BFvM3Ddca9V6yl.png',
      ),
      title: Text('暂无数据'),
    ));

    children.add(VooError(
      type: VooErrorType.empty_comment,
      title: Text('暂无评论'),
    ));

    children.add(VooError(
      type: VooErrorType.sys_error,
      title: Text('系统错误'),
    ));
    return SingleChildScrollView(child: Column(children: children));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: UiComponent.getTitleBar(title: 'ErrorPagePreview'),
      body: contentView(),
    );
  }
}
