import '../../comm/ui_component.dart';
import 'package:flutter/material.dart';
import 'package:voo/voo.dart';

///蒙版页面
class GuidePage extends StatefulWidget {
  @override
  GuidePageState createState() => GuidePageState();
}

class GuidePageState extends State<GuidePage> {
  double screenWidth;
  double screenHeight;

  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      screenWidth = MediaQuery.of(context).size.width;
      screenHeight = MediaQuery.of(context).size.height;

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
            child: VooButton(
              child: Text('显示Demo'),
              onPressed: () => showDemoMask(type: 1),
            ),
          ),
          SizedBox(width: 16),
          Container(
            width: 120,
            height: 40,
            child: VooButton(
              child: Text('显示Demo2'),
              onPressed: () => showDemoMask(type: 2),
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
        child: Text('手势引导'),
        onPressed: showGuideMask,
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
  void showDemoMask({int type = 1}) {
    VooUtil.showTransparentPage(
      context,
      child: StatefulBuilder(
        builder: (context, state) {
          Size size = Size(120, 40);
          Offset offset = Offset(16, 32.0 + 56 + 56);

          List<Widget> children = [];
          children.add(GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Container(color: Color.fromRGBO(0, 0, 0, 0.5)),
          ));
          if (type == 1) {
            offset = Offset(16, 32.0 + 56 + 56);
            children.add(Positioned(
              left: 16,
              top: 32.0 + 56 + 56 - 60,
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
            ));
          } else {
            offset = Offset(16 + 120 + 16.0, 32.0 + 56 + 56);
            children.add(Positioned(
              left: 0,
              top: 32.0 + 56 + 56 + 40,
              child: GestureDetector(
                onTap: () {
                  type = 1;
                  Navigator.pop(context);
                },
                child: Image.network(
                  'https://img1.8591.com.hk/images/goods/20200706/4yyQIbdYVWuxCPTkVOnIqHGhwsjiKYkeQ6llgHp5.png',
                  width: 300,
                  height: 300,
                ),
              ),
            ));
          }
          return ClipPath(
            key: Key('$type'),
            clipper: VooInvertedCircleClipper(maskSize: size, maskOffset: offset),
            child: Stack(children: children),
          );
        },
      ),
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
