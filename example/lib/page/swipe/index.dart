import 'package:example/comm/ui_component.dart';
import 'package:flutter/material.dart';
import 'package:voo/voo.dart';

///轮播图
class SwipeView extends StatelessWidget {
  final GlobalKey swipeKey = GlobalKey();
  final List<String> images = [
    'assets/comm/image1.webp',
    'assets/comm/image2.webp',
    'assets/comm/image3.webp',
    'assets/comm/image4.webp'
  ];

  Widget itemImageBuilder(int index) {
    return Image.asset(images[index], fit: BoxFit.cover);
  }

  //内容视图
  Widget contentView() {
    List<Widget> children = [];

    children.add(ListTile(title: Text('默认')));
    children.add(VooSwipe(
      autoPlay: false,
      height: 200.0,
      loop: false,
      viewportFraction: 0.9,
      scaleFactor: 0.8,
      itemCount: images.length,
      itemBuilder: itemImageBuilder,
    ));
    children.add(ListTile(title: Text('隐藏indicators')));
    children.add(VooSwipe(
      height: 150.0,
      displayIndicators: false,
      itemCount: 4,
      itemBuilder: itemImageBuilder,
    ));
    children.add(ListTile(title: Text('禁止循环')));
    children.add(VooSwipe(
      height: 150.0,
      loop: false,
      itemCount: 4,
      defaultIndex: 1,
      itemBuilder: itemImageBuilder,
      selectIndicatorColor: Colors.blue,
      unSelectIndicatorColor: Colors.orange,
    ));
    children.add(ListTile(title: Text('禁止自动播放')));
    children.add(VooSwipe(
      height: 150.0,
      autoPlay: false,
      itemCount: 4,
      itemBuilder: itemImageBuilder,
    ));
    children.add(ListTile(title: Text('默认展示第二页')));
    children.add(VooSwipe(
      height: 150.0,
      defaultIndex: 1,
      itemCount: 4,
      autoPlay: true,
      itemBuilder: itemImageBuilder,
      onChanged: (number) {},
    ));
    children.add(ListTile(title: Text('手动切换到指定页')));
    children.add(VooSwipe(
      key: swipeKey,
      height: 150.0,
      itemCount: 4,
      itemBuilder: itemImageBuilder,
    ));
    children.add(SizedBox(height: 16));
    children.add(VooButton(
      child: '外部控制',
      onTap: () {
        (swipeKey.currentState as VooSwipeState).setIndex(2);
      },
    ));
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Column(children: children),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: UiComponent.getTitleBar(title: 'SwipeView'),
      body: contentView(),
    );
  }
}
