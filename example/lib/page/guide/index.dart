import 'package:voo/button/index.dart';
import 'package:voo/guide/voo_mask.dart';
import 'package:voo/util/index.dart';

import '../../comm/ui_component.dart';
import 'package:flutter/material.dart';

///蒙版页面
class GuidePage extends StatefulWidget {
  @override
  GuidePageState createState() => GuidePageState();
}

class GuidePageState extends State<GuidePage> {
  double screenWidth;
  double screenHeight;

  GlobalKey key1 = GlobalKey();
  Offset offsetLeftTop1;
  Offset offsetRightBottom1;

  GlobalKey key2 = GlobalKey();
  Offset offsetLeftTop2;
  Offset offsetRightBottom2;

  GlobalKey key3 = GlobalKey();
  Offset offsetLeftTop3;
  Offset offsetRightBottom3;

  GlobalKey key4 = GlobalKey();
  Offset offsetLeftTop4;
  Offset offsetRightBottom4;

  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      screenWidth = MediaQuery.of(context).size.width;
      screenHeight = MediaQuery.of(context).size.height;

      RenderBox renderBox1 = key1.currentContext.findRenderObject();
      offsetLeftTop1 = renderBox1.localToGlobal(Offset.zero);
      offsetRightBottom1 = renderBox1.localToGlobal(Offset(renderBox1.size.width, renderBox1.size.height));

      RenderBox renderBox2 = key2.currentContext.findRenderObject();
      offsetLeftTop2 = renderBox2.localToGlobal(Offset.zero);
      offsetRightBottom2 = renderBox2.localToGlobal(Offset(renderBox2.size.width, renderBox2.size.height));

      RenderBox renderBox3 = key3.currentContext.findRenderObject();
      offsetLeftTop3 = renderBox3.localToGlobal(Offset.zero);
      offsetRightBottom3 = renderBox3.localToGlobal(Offset(renderBox3.size.width, renderBox3.size.height));

      RenderBox renderBox4 = key4.currentContext.findRenderObject();
      offsetLeftTop4 = renderBox4.localToGlobal(Offset.zero);
      offsetRightBottom4 = renderBox4.localToGlobal(Offset(renderBox4.size.width, renderBox4.size.height));
    });
  }

  //内容视图
  Widget contentView() {
    List<Widget> children = [];
    children.add(UiComponent.getListTile(title: '引出说明'));
    children.add(Container(
      margin: EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          Container(
            width: 120,
            height: 40,
            key: key1,
            child: VooButton(
              child: '显示Demo',
              onTap: showDemoMask1,
            ),
          ),
          SizedBox(width: 16),
          Container(
            width: 120,
            height: 40,
            key: key2,
            child: VooButton(
              child: '显示Demo2',
              onTap: showDemoMask2,
            ),
          ),
        ],
      ),
    ));

    children.add(UiComponent.getListTile(title: '联动视图'));
    children.add(Container(
      margin: EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          Container(
            width: 120,
            height: 40,
            key: key3,
            child: VooButton(
              child: '显示Demo3',
              onTap: () => showDemoMaskMore(type: 1),
            ),
          ),
          SizedBox(width: 16),
          Container(
            width: 120,
            height: 40,
            key: key4,
            child: VooButton(
              child: '显示Demo4',
              onTap: () => showDemoMaskMore(type: 2),
            ),
          ),
        ],
      ),
    ));

    children.add(UiComponent.getListTile(title: '手势引导'));

    children.add(Container(
      width: 120,
      height: 40,
      margin: EdgeInsets.symmetric(horizontal: 16),
      child: VooButton(
        child: '手势引导',
        onTap: showGuideMask,
      ),
    ));

    return SingleChildScrollView(
      child: Column(
        children: children,
        crossAxisAlignment: CrossAxisAlignment.start,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: UiComponent.getTitleBar(title: 'GuidePreview'),
      body: contentView(),
    );
  }

  //显示demo蒙版
  void showDemoMask1() {
    VooUtil.showTransparentPage(
      context,
      child: VooMaskView(
        size: Size(offsetRightBottom1.dx - offsetLeftTop1.dx, offsetRightBottom1.dy - offsetLeftTop1.dy),
        offset: offsetLeftTop1,
        child: Positioned(
          left: offsetLeftTop1.dx,
          top: offsetLeftTop1.dy - 60,
          child: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Image.network(
              'https://img1.8591.com.hk/images/goods/20200706/xlkl0rW5m4IkIOPPyU2DRzY5tqoHYJJpxccl2rQm.png',
              width: 300,
              height: 60,
            ),
          ),
        ),
      ),
    );
  }

  //显示demo蒙版
  void showDemoMask2() {
    VooUtil.showTransparentPage(
      context,
      child: VooMaskView(
        size: Size(offsetRightBottom2.dx - offsetLeftTop2.dx, offsetRightBottom2.dy - offsetLeftTop2.dy),
        offset: offsetLeftTop2,
        child: Positioned(
          left: 0,
          top: offsetRightBottom2.dy,
          child: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Image.network(
              'https://img1.8591.com.hk/images/goods/20200706/4yyQIbdYVWuxCPTkVOnIqHGhwsjiKYkeQ6llgHp5.png',
              width: 300,
              height: 300,
            ),
          ),
        ),
      ),
    );
  }

  //联动蒙版
  void showDemoMaskMore({int type = 1}) {
    VooUtil.showTransparentPage(
      context,
      child: StatefulBuilder(builder: (context, state) {
        if (type == 1) {
          return VooMaskView(
            key: Key('1'),
            size: Size(offsetRightBottom3.dx - offsetLeftTop3.dx, offsetRightBottom3.dy - offsetLeftTop3.dy),
            offset: offsetLeftTop3,
            child: Positioned(
              left: offsetLeftTop3.dx,
              top: offsetLeftTop3.dy - 60,
              child: GestureDetector(
                onTap: () {
                  type = 2;
                  state(() {});
                },
                child: Image.network(
                  'https://img1.8591.com.hk/images/goods/20200706/xlkl0rW5m4IkIOPPyU2DRzY5tqoHYJJpxccl2rQm.png',
                  width: 300,
                  height: 60,
                ),
              ),
            ),
          );
        } else {
          return VooMaskView(
            key: Key('2'),
            size: Size(offsetRightBottom4.dx - offsetLeftTop4.dx, offsetRightBottom4.dy - offsetLeftTop4.dy),
            offset: offsetLeftTop4,
            child: Positioned(
              left: 0,
              top: offsetRightBottom4.dy,
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Image.network(
                  'https://img1.8591.com.hk/images/goods/20200706/4yyQIbdYVWuxCPTkVOnIqHGhwsjiKYkeQ6llgHp5.png',
                  width: 300,
                  height: 300,
                ),
              ),
            ),
          );
        }
      }),
    );
  }

  //显示手势引导
  void showGuideMask() {
    VooUtil.showTransparentPage(
      context,
      child: VooMaskView(
        child: Positioned(
          left: 0,
          top: 48 + 48 + 16.0 + 40,
          child: Image.network(
            'https://img1.8591.com.hk/images/goods/20200706/1escuSIgV1tMug4PDMfR9jc7WIS2V2EZihiSttft.png',
            width: 300,
            height: 300,
          ),
        ),
      ),
    );
  }
}

