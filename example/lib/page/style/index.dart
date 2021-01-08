import '../../comm/ui_component.dart';
import 'package:flutter/material.dart';
import 'package:voo/cell/index.dart';

///样式
class StylePage extends StatefulWidget {
  @override
  StylePageState createState() => StylePageState();
}

class StylePageState extends State<StylePage> with SingleTickerProviderStateMixin {
  AnimationController controller;
  CurvedAnimation animationFade;
  Animation<Offset> animationSlideUp;
  Animation<Offset> animationSlideDown;
  Animation<Offset> animationSlideLeft;
  Animation<Offset> animationSlideRight;

  int visibilityIndex = 0;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(duration: const Duration(milliseconds: 500), vsync: this);
    controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        controller.reverse();
      } else if (status == AnimationStatus.dismissed) {
        visibilityIndex = 0;
        if (mounted) setState(() {});
      }
    });
    animationFade = CurvedAnimation(parent: controller, curve: Curves.easeInOut);

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      double screenWidth = MediaQuery.of(context).size.width;
      double screenHeight = MediaQuery.of(context).size.width;

      double middleWidth = (screenWidth - 100) / 2;
      double middleHeight = (screenHeight - 100) / 2 + 50;

      animationSlideUp = Tween(
        begin: Offset(middleWidth, middleHeight - 100),
        end: Offset(middleWidth, middleHeight),
      ).animate(controller);

      animationSlideDown = Tween(
        begin: Offset(middleWidth, middleHeight + 100),
        end: Offset(middleWidth, middleHeight),
      ).animate(controller);

      animationSlideLeft = Tween(
        begin: Offset(middleWidth - 100, middleHeight),
        end: Offset(middleWidth, middleHeight),
      ).animate(controller);

      animationSlideRight = Tween(
        begin: Offset(middleWidth + 100, middleHeight),
        end: Offset(middleWidth, middleHeight),
      ).animate(controller);
    });
  }

  //内容视图
  Widget contentView() {
    List<Widget> children = [];

    children.add(UiComponent.getListTile(title: '文字省略'));

    children.add(Container(
      margin: EdgeInsets.symmetric(horizontal: 16),
      child: Text(
        '这是一段最多显示一行的文字，后面的内容会省略.这是一段最多显示一行的文字，后面的内容会省略.',
        overflow: TextOverflow.ellipsis,
      ),
    ));

    children.add(Container(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: Text(
        '这是一段最多显示一行的文字，后面的内容会省略.这是一段最多显示一行的文字，后面的内容会省略.这是一段最多显示一行的文字，后面的内容会省略.',
        overflow: TextOverflow.ellipsis,
        maxLines: 2,
      ),
    ));

    children.add(UiComponent.getListTile(title: '1px边框'));
    children.add(Container(
      height: 30,
      color: Colors.white,
      alignment: Alignment.center,
      child: Divider(height: 1),
    ));

    children.add(UiComponent.getListTile(title: '动画'));
    children.add(VooCell(
      title: 'Fade',
      onTap: onFade,
    ));
    children.add(Divider(height: 1));
    children.add(VooCell(
      title: 'Slide Up',
      onTap: onSlideUp,
    ));
    children.add(Divider(height: 1));
    children.add(VooCell(
      title: 'Slide Down',
      onTap: onSlideDown,
    ));
    children.add(Divider(height: 1));
    children.add(VooCell(
      title: 'Slide Left',
      onTap: onSlideLeft,
    ));
    children.add(Divider(height: 1));
    children.add(VooCell(
      title: 'Slide Right',
      onTap: onSlideRight,
    ));

    return SingleChildScrollView(child: Column(children: children));
  }

  Widget visibilityView() {
    switch (visibilityIndex) {
      case 1:
        return Align(
          alignment: Alignment.center,
          child: FadeTransition(
            opacity: animationFade,
            child: Container(
              width: 100,
              height: 100,
              color: Colors.blue,
              alignment: Alignment.center,
              child: Text('fade', style: TextStyle(color: Colors.white)),
            ),
          ),
        );
        break;
      case 2:
        return AnimatedBuilder(
          animation: controller,
          builder: (context, child) {
            return Transform.translate(
              offset: animationSlideUp.value,
              child: Container(
                width: 100,
                height: 100,
                color: Colors.blue,
                alignment: Alignment.center,
                child: Text('slide up', style: TextStyle(color: Colors.white)),
              ),
            );
          },
        );
        break;
      case 3:
        return AnimatedBuilder(
            animation: controller,
            builder: (context, child) {
              return Transform.translate(
                offset: animationSlideDown.value,
                child: Container(
                  width: 100,
                  height: 100,
                  color: Colors.blue,
                  alignment: Alignment.center,
                  child: Text('slide down', style: TextStyle(color: Colors.white)),
                ),
              );
            });
        break;
      case 4:
        return AnimatedBuilder(
            animation: controller,
            builder: (context, child) {
              return Transform.translate(
                offset: animationSlideLeft.value,
                child: Container(
                  width: 100,
                  height: 100,
                  color: Colors.blue,
                  alignment: Alignment.center,
                  child: Text('slide left', style: TextStyle(color: Colors.white)),
                ),
              );
            });
        break;
      case 5:
        return AnimatedBuilder(
            animation: controller,
            builder: (context, child) {
              return Transform.translate(
                offset: animationSlideRight.value,
                child: Container(
                  width: 100,
                  height: 100,
                  color: Colors.blue,
                  alignment: Alignment.center,
                  child: Text('slide right', style: TextStyle(color: Colors.white)),
                ),
              );
            });
        break;
      default:
        return SizedBox.shrink();
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> children = [];
    children.add(contentView());
    children.add(visibilityView());

    return Scaffold(
      appBar: UiComponent.getTitleBar(title: 'StylePreview'),
      body: Stack(children: children),
    );
  }

  void onFade() {
    visibilityIndex = 1;
    setState(() {});
    controller.forward();
  }

  void onSlideUp() {
    visibilityIndex = 2;
    setState(() {});
    controller.forward();
  }

  void onSlideDown() {
    visibilityIndex = 3;
    setState(() {});
    controller.forward();
  }

  void onSlideLeft() {
    visibilityIndex = 4;
    setState(() {});
    controller.forward();
  }

  void onSlideRight() {
    visibilityIndex = 5;
    setState(() {});
    controller.forward();
  }
}
