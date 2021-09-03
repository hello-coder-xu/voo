import 'dart:async';

import 'package:flutter/material.dart';
import 'package:voo/badge/index.dart';

enum VooSwipeIndicatorAxis { horizontal, vertical }

///轮播图
class VooSwipe extends StatefulWidget {
  final GlobalKey? key;
  final int itemCount;
  final Widget Function(int index) itemBuilder;
  final Axis scrollDirection;

  //item 高度
  final double height;

  //默认位置
  final int defaultIndex;

  //是否循环
  final bool loop;

  //是否自动滚动
  final bool autoPlay;

  //自动滚动间隔时间
  final int duration;

  //滚动速度
  final int speed;

  //滚动动画
  final Curve curve;

  // 回调
  final Function(int index)? onChanged;

  //是否显示指示器
  final bool displayIndicators;

  // 滚动方向
  final VooSwipeIndicatorAxis swipeIndicatorAxis;

  // 指示器显示位置
  final Alignment indicatorPosition;

  // 指示器未选择颜色
  final Color unSelectIndicatorColor;

  // 指示器选中颜色
  final Color selectIndicatorColor;

  //缩放系数
  final double scaleFactor;

  // 显示系数
  final double viewportFraction;

  VooSwipe({
    this.key,
    required this.itemCount,
    required this.itemBuilder,
    this.scrollDirection = Axis.horizontal,
    this.height = 200,
    this.defaultIndex = 0,
    this.loop = true,
    this.displayIndicators = true,
    this.indicatorPosition = Alignment.bottomCenter,
    this.autoPlay = true,
    this.duration = 3000,
    this.speed = 280,
    this.curve = Curves.bounceIn,
    this.unSelectIndicatorColor = Colors.white,
    this.selectIndicatorColor = Colors.red,
    this.swipeIndicatorAxis = VooSwipeIndicatorAxis.horizontal,
    this.scaleFactor = 1.0,
    this.viewportFraction = 1.0,
    this.onChanged,
  })  : assert(itemCount >= 1),
        assert(defaultIndex >= 0),
        super(key: key);

  @override
  VooSwipeState createState() => VooSwipeState();
}

class VooSwipeState extends State<VooSwipe> {
  PageController? pageController;
  int? position;
  double? currPageValue = 0.0;
  int? itemCount;
  late double pointSize;
  double? pointPaddingSpace;
  Timer? timer;

  @override
  void initState() {
    super.initState();
    itemCount = widget.loop ? widget.itemCount + 2 : widget.itemCount;
    position = widget.defaultIndex;
    currPageValue = widget.defaultIndex * 1.0;
    pointPaddingSpace = widget.height / 50;
    pointSize = widget.height / 40;

    if (widget.loop) {
      pageController = PageController(initialPage: widget.defaultIndex);
    } else {
      pageController = PageController(
        initialPage: widget.defaultIndex,
        viewportFraction: widget.viewportFraction,
      );
      pageController!.addListener(() {
        currPageValue = pageController!.page;
        if (mounted) setState(() {});
      });
    }
    startAutoPlay();
  }

  @override
  Widget build(BuildContext context) {
    Widget child = _pageView();
    if (widget.displayIndicators) {
      List<Widget> children = [];
      children.add(child);
      children.add(Positioned(child: indicatorView()));
      child = Stack(
        children: children,
        alignment: widget.indicatorPosition,
      );
    }
    return Container(
      height: widget.height,
      child: child,
    );
  }

  ///滚动视图
  Widget _pageView() {
    Widget child = PageView.builder(
      controller: pageController,
      scrollDirection: widget.scrollDirection,
      itemBuilder: _itemBuilder,
      onPageChanged: onPageChanged,
      itemCount: itemCount,
    );

    if (widget.autoPlay) {
      child = Listener(
        onPointerDown: onPointerDown,
        onPointerUp: onPointerUp,
        child: child,
      );
    }
    return child;
  }

  ///指示器视图
  Widget indicatorView() {
    List<Widget> children = [];

    Widget child;
    double? pointPaddingHorizontal = 0;
    double? pointPaddingVertical = 0;
    double? paddingHorizontal;
    double? paddingVertical;
    if (widget.swipeIndicatorAxis == VooSwipeIndicatorAxis.horizontal) {
      child = Row(
        children: children,
        mainAxisSize: MainAxisSize.min,
      );
      paddingHorizontal = pointPaddingSpace! * 2;
      paddingVertical = pointPaddingSpace;
      pointPaddingHorizontal = pointPaddingSpace;
    } else {
      child = Column(
        children: children,
        mainAxisSize: MainAxisSize.min,
      );
      paddingHorizontal = pointPaddingSpace;
      paddingVertical = pointPaddingSpace! * 2;
      pointPaddingVertical = pointPaddingSpace;
    }

    List.generate(widget.itemCount, (index) {
      children.add(Padding(
        padding: EdgeInsets.symmetric(
          horizontal: pointPaddingHorizontal!,
          vertical: pointPaddingVertical!,
        ),
        child: VooBadge(
          style: VooBadgeStyle.point,
          bgColor: index == position! % widget.itemCount ? widget.selectIndicatorColor : widget.unSelectIndicatorColor,
        ),
      ));
    });

    return Container(
      margin: EdgeInsets.all(widget.height / 20),
      padding: EdgeInsets.symmetric(
        horizontal: paddingHorizontal!,
        vertical: paddingVertical!,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(pointSize + pointPaddingSpace! * 2)),
        color: Colors.black12,
      ),
      child: child,
    );
  }

  Widget _itemBuilder(BuildContext context, int index) {
    if (widget.loop) {
      return widget.itemBuilder(index % widget.itemCount);
    } else {
      Matrix4 matrix4 = Matrix4.identity();
      var tempFloor = currPageValue!.floor();
      if (index == tempFloor) {
        //当前的item
        var currScale = 1 - (currPageValue! - index) * (1 - widget.scaleFactor);
        var currTrans = widget.height * (1 - currScale) / 2.0;

        matrix4 = Matrix4.diagonal3Values(1.0, currScale, 1.0);
        matrix4.setTranslationRaw(0.0, currTrans, 0.0);
      } else if (index == tempFloor + 1) {
        //右边的item
        var currScale = widget.scaleFactor + (currPageValue! - index + 1) * (1 - widget.scaleFactor);
        var currTrans = widget.height * (1 - currScale) / 2.0;

        matrix4 = Matrix4.diagonal3Values(1.0, currScale, 1.0);
        matrix4.setTranslationRaw(0.0, currTrans, 0.0);
      } else if (index == tempFloor - 1) {
        //左边
        var currScale = 1 - (currPageValue! - index) * (1 - widget.scaleFactor);
        var currTrans = widget.height * (1 - currScale) / 2.0;

        matrix4 = Matrix4.diagonal3Values(1.0, currScale, 1.0);
        matrix4.setTranslationRaw(0.0, currTrans, 0.0);
      } else {
        //其他，不在屏幕显示的item
        matrix4 = Matrix4.diagonal3Values(1.0, widget.scaleFactor, 1.0);
        matrix4.setTranslationRaw(0.0, widget.height * (1 - widget.scaleFactor) / 2, 0.0);
      }
      return Transform(
        transform: matrix4,
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 10),
          child: widget.itemBuilder(index),
        ),
      );
    }
  }

  void onPageChanged(int index) {
    if (index != position) {
      _callBackOnChange(index % widget.itemCount);
    }
    if (widget.loop) {
      if (index == 0) {
        position = widget.itemCount;
        //延时归为用于为循环
        Timer(Duration(milliseconds: 300), () {
          pageController!.jumpToPage(position!);
        });
      } else if (index == widget.itemCount + 1) {
        position = 1;
        //延时归为用于为循环
        Timer(Duration(milliseconds: 300), () {
          pageController!.jumpToPage(position!);
        });
      } else {
        position = index;
      }
    } else {
      position = index;
    }
    if (mounted) setState(() {});
  }

  void setIndex(int index) {
    pageController!.animateToPage(
      index,
      duration: Duration(milliseconds: widget.speed),
      curve: widget.curve,
    );
  }

  void previousPage() {
    pageController!.previousPage(
      duration: Duration(milliseconds: widget.speed),
      curve: widget.curve,
    );
  }

  void nextPage() {
    pageController!.nextPage(
      duration: Duration(milliseconds: widget.speed),
      curve: widget.curve,
    );
  }

  void startAutoPlay() {
    if (!widget.autoPlay) return;
    if (timer?.isActive ?? false) {
      timer!.cancel();
    }

    timer = Timer.periodic(
      Duration(milliseconds: widget.duration),
      (_) {
        if (position == widget.itemCount - 1 && !widget.loop) {
          setIndex(0);
          return;
        }
        nextPage();
      },
    );
  }

  // 停止自动播放
  void stopAutoPlay() {
    timer?.cancel();
    timer = null;
  }

  onPointerDown(event) => stopAutoPlay();

  onPointerUp(event) => startAutoPlay();

  void _callBackOnChange(int number) {
    if (widget.onChanged != null) {
      widget.onChanged!(number);
    }
  }

  @override
  void dispose() {
    pageController?.dispose();
    stopAutoPlay();
    super.dispose();
  }
}
