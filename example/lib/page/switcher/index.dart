import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:voo/switcher/index.dart';

class StateSwitcherPage extends StatefulWidget {
  @override
  _StateSwitcherPageState createState() => _StateSwitcherPageState();
}

class _StateSwitcherPageState extends State<StateSwitcherPage> {
  PageState pageState = PageState.error;
  int currentPage = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        title: Text("StateSwitcher Demo"),
      ),
      body: StateSwitcher(
        pageState: pageState,
        onRetry: () {
          if (currentPage == 1) {
            Future.delayed(Duration(seconds: 2), () {
              pageState = PageState.empty;
              currentPage = 2;
              setState(() {});
            });
          } else if (currentPage == 2) {
            Future.delayed(Duration(seconds: 2), () {
              pageState = PageState.content;
              currentPage = 3;
              setState(() {});
            });
          }
        },
        child: Container(
          alignment: Alignment.center,
          child: Text(
            "Content",
            style: TextStyle(fontSize: 20),
          ),
        ),
      ),
    );
  }
}
