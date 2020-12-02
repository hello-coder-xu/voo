import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:voo/tabbar/index.dart';

class TabBarPage extends StatefulWidget {
  @override
  _TabBarPageState createState() => _TabBarPageState();
}

class _TabBarPageState extends State<TabBarPage> with TickerProviderStateMixin {
  TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        title: Text("TabBar Indicator Demo"),
        backgroundColor: Colors.white60,
      ),
      body: Column(children: [
        /// 原点
        renderTabBar(
          indicator: RoundTabIndicator(height: 3, width: 3),
        ),

        SizedBox(height: 16),

        /// 线条
        renderTabBar(
          indicator: RoundTabIndicator(height: 3, width: 25),
        ),

        SizedBox(height: 16),

        /// 矩形
        renderTabBar(
          labelColor: Colors.white,
          unselectedLabelColor: Colors.black,
          indicator: RoundTabIndicator(height: 50, width: 150),
        ),

        SizedBox(height: 16),

        /// 椭圆
        renderTabBar(
          labelColor: Colors.white,
          unselectedLabelColor: Colors.black,
          indicator: RoundTabIndicator(
            height: 30,
            width: 100,
            color: Colors.blue,
            borderRadius: BorderRadius.circular(20),
            alignment: IndicatorAlignment.center,
          ),
        ),

        SizedBox(height: 16),

        /// Radius 根据 index 变换
        renderTabBar(
          labelColor: Colors.white,
          unselectedLabelColor: Colors.black,
          indicator: RoundTabIndicator(
            height: 50,
            width: 150,
            onRadiusChanged: (offsetIndex) {
              if (offsetIndex.toInt() == 0) {
                return BorderRadius.horizontal(
                  left: Radius.lerp(
                    Radius.circular(15),
                    Radius.circular(0),
                    offsetIndex,
                  ),
                );
              } else if (offsetIndex.toInt() == 1) {
                return BorderRadius.horizontal(
                  right: Radius.lerp(
                    Radius.circular(0),
                    Radius.circular(15),
                    offsetIndex - 1,
                  ),
                );
              } else {
                return BorderRadius.horizontal(
                  right: Radius.lerp(
                    Radius.circular(15),
                    Radius.circular(15),
                    offsetIndex - 2,
                  ),
                );
              }
            },
          ),
        ),

        SizedBox(height: 16),
      ]),
    );
  }

  Widget renderTabBar({Color labelColor, Color unselectedLabelColor, Decoration indicator}) {
    return Container(
      height: 40,
      width: double.infinity,
      alignment: Alignment.center,
      color: Colors.white,
      child: TabBar(
        controller: tabController,
        tabs: getTabText(),
        labelColor: labelColor ?? Colors.black,
        labelPadding: EdgeInsets.zero,
        unselectedLabelColor: unselectedLabelColor ?? Colors.black,
        isScrollable: true,
        labelStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        unselectedLabelStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
        indicatorColor: Colors.black,
        // indicator: RoundTabIndicator(height: 3, width: 25),
        indicator: indicator,
      ),
    );
  }

  List<Widget> getTabText() {
    return ["1111", "2222", "3333"]
        .asMap()
        .map((key, value) => MapEntry(
            key,
            Container(
              height: 45,
              width: 100,
              alignment: Alignment.center,
              child: Text("$value"),
            )))
        .values
        .toList();
  }
}
