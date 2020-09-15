import 'package:example/comm/ui_component.dart';
import 'package:flutter/material.dart';
import 'package:voo/voo.dart';

///搜索栏
class SearchBarPage extends StatelessWidget {
  //内容
  Widget contentView() {
    List<Widget> children = [];
    children.add(UiComponent.getListTile(title: '基础样式'));
    children.add(VooSearchBar(
      child: VooField(
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: '请输入搜索内容',
        ),
        showClear: true,
      ),
    ));

    children.add(UiComponent.getListTile(title: '反白搜索'));
    children.add(VooSearchBar(
      bgColor: Colors.black,
      roundBgColor: Colors.grey[700],
      child: VooField(
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: '请输入搜索内容',
          hintStyle: TextStyle(color: Colors.white),
        ),
        style: TextStyle(color: Colors.white),
        showClear: true,
      ),
      contentIcon: Icon(Icons.search, color: Colors.white),
    ));

    children.add(UiComponent.getListTile(title: '右侧单图标'));
    children.add(VooSearchBar(
      child: VooField(
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: '请输入搜索内容',
        ),
        showClear: true,
      ),
      trailing: Icon(VooIcon.avatar),
    ));

    children.add(UiComponent.getListTile(title: '右侧双图标'));
    children.add(VooSearchBar(
      child: VooField(
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: '请输入搜索内容',
        ),
        showClear: true,
      ),
      trailing: Row(
        children: [
          Icon(VooIcon.avatar),
          SizedBox(width: 8),
          Icon(VooIcon.more),
        ],
      ),
    ));

    children.add(UiComponent.getListTile(title: '左右两边文字/图标'));
    children.add(VooSearchBar(
      leading: Row(
        children: [
          Text('台北'),
          Icon(Icons.keyboard_arrow_down, color: Colors.grey),
        ],
      ),
      child: VooField(
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: '请输入搜索内容',
        ),
        showClear: true,
      ),
      trailing: Icon(VooIcon.avatar),
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
    );
  }
}
