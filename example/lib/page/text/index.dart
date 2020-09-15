import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:voo/text/index.dart';

class ExpandableTextPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        title: Text("ExpandableText Demo"),
      ),
      body: Column(children: [
        ExpandableText(
          text: "11111111111111111111111111111111111111111111111111111111111111"
              "阿斯加德和建行阿斯加德和建行阿斯加德和建行阿斯加德和建行阿斯加德和建行阿斯"
              "11111111111111111111111111111111111111111111111111111111111111"
              "阿斯加德和建行阿斯加德和建行阿斯加德和建行阿斯加德和建行阿斯加德和建行阿斯"
              "11111111111111111111111111111111111111111111111111111111111111",
          textStyle: TextStyle(fontSize: 16, color: Colors.black),
          expandText: "点击加载更多吧~",
          expandTextStyle: TextStyle(fontSize: 17, color: Colors.green),
          maxLines: 3,
        ),
        SizedBox(height: 100),
        ExpandableIconText(
          text: "11111111111111111111111111111111111111111111111111111111111111"
              "阿斯加德和建行阿斯加德和建行阿斯加德和建行阿斯加德和建行阿斯加德和建行阿斯"
              "11111111111111111111111111111111111111111111111111111111111111"
              "阿斯加德和建行阿斯加德和建行阿斯加德和建行阿斯加德和建行阿斯加德和建行阿斯",
          style: TextStyle(fontSize: 16, color: Colors.black),
          maxLines: 3,
        ),
      ]),
    );
  }
}
