import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:voo/bubble/index.dart';

class BubbleBoxPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        title: Text("BubbleBox Demo"),
      ),
      body: ListView(children: [
        renderItemText(),
        renderItemText(),
        renderItemImage(),
        renderItemText(),
        renderItemImage(),
        renderItemText(),
        renderItemImage(),
      ]),
    );
  }

  Widget renderItemText() {
    return Padding(
      padding: EdgeInsets.only(top: 8, bottom: 8, left: 12, right: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipOval(
            child: Container(
              height: 32,
              width: 32,
              color: Colors.grey,
            ),
          ),
          SizedBox(width: 8),
          BubbleBox(
            radius: Radius.circular(4),
            arrowOffset: 4,
            constraints: BoxConstraints(maxWidth: 200),
            child: Text(
              "121213213s2sdfsds233d51121213213s2sdfsds233d51121213213s2sdfsds233d51121213213s2sdfsds233d51",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }

  Widget renderItemImage() {
    return Padding(
      padding: EdgeInsets.only(top: 8, bottom: 8, left: 12, right: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          BubbleBox(
            radius: Radius.circular(5),
            padding: EdgeInsets.zero,
            arrowDirection: ArrowDirection.right,
            arrowOffset: 4,
            constraints: BoxConstraints(maxWidth: 200),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: Image.network(
                "https://flutter.dev/assets/ui/layout/lakes-2e8707102ca4f56f44e40ce3703606e1600ac1574fe5544c0f2d96f966bed853.jpg",
              ),
            ),
          ),
          SizedBox(width: 8),
          ClipOval(
            child: Container(
              height: 32,
              width: 32,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
