import 'package:example/comm/ui_component.dart';
import 'package:voo/icon/index.dart';
import 'package:voo/search_bar/index.dart';
import 'package:flutter/material.dart';
import 'package:voo/voo.dart';

///搜索栏
class SearchBarPage extends StatelessWidget {
  //内容
  Widget contentView() {
    List<Widget> children = [];
    children.add(SizedBox(height: 32));

    children.add(VooSearchBar(
      hintText: '请输入搜索内容',
      showClear: true,
    ));

    children.add(SizedBox(height: 32));
    children.add(VooSearchBar(
      bgColor: Colors.black,
      fillColor: Colors.grey[700],
      hintText: '请输入搜索内容',
      hintStyle: TextStyle(color: Colors.white),
      style: TextStyle(color: Colors.white),
      showClear: true,
      prefixIcon: Icon(Icons.search, color: Colors.white),
    ));

    children.add(SizedBox(height: 32));
    children.add(VooSearchBar(
      hintText: '请输入搜索内容',
      showClear: true,
      trailing: Icon(VooIcon.avatar, size: 20),
    ));

    children.add(SizedBox(height: 32));
    children.add(VooSearchBar(
      hintText: '请输入搜索内容',
      showClear: true,
      trailing: Row(
        children: [
          Icon(VooIcon.avatar, size: 20),
          SizedBox(width: 8),
          Icon(VooIcon.more, size: 20),
        ],
      ),
    ));

    children.add(SizedBox(height: 32));
    children.add(VooSearchBar(
      leading: Row(
        children: [
          Text('台北', style: TextStyle(color: Colors.black87, fontSize: 16)),
          Icon(Icons.keyboard_arrow_down, color: Colors.black87),
        ],
      ),
      hintText: '请输入搜索内容',
      showClear: true,
      trailing: Icon(VooIcon.avatar, size: 20),
    ));

    return SingleChildScrollView(
      padding: EdgeInsets.only(bottom: 32),
      child: Column(children: children),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: UiComponent.getTitleBar(title: 'SearchBarPreview'),
      body: contentView(),
      backgroundColor: Colors.grey[200],
    );
  }
}
