import 'package:flutter/material.dart';
import 'package:voo/button/animated_button.dart';

class AnimatedButtonPage extends StatefulWidget {
  @override
  _AnimatedButtonPageState createState() => _AnimatedButtonPageState();
}

class _AnimatedButtonPageState extends State<AnimatedButtonPage> {
  final ButtonController controller = ButtonController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("AnimatedButton Demo"),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            renderBtn1(),
            SizedBox(height: 60),
            renderBtn2(),
            SizedBox(height: 60),
            renderBtn3(),
            SizedBox(height: 60),
            renderBtn4(),
          ],
        ),
      ),
    );
  }

  Widget renderBtn1() {
    return AnimatedButton(
      size: 36,
      switchOn: false,
      onTap: (switchOn) {
        print("btn1 switchOn: $switchOn");
      },
    );
  }

  Widget renderBtn2() {
    return AnimatedButton(
      size: 36,
      switchOn: true,
      onTap: (switchOn) {
        print("btn2 switchOn: $switchOn");
      },
    );
  }

  bool switchOn3 = false;
  int favorCount3 = 3;

  Widget renderBtn3() {
    return GestureDetector(
      onTap: () {
        controller.onTap();
        setState(() {
          switchOn3 = !switchOn3;
          if (switchOn3)
            favorCount3++;
          else
            favorCount3--;
        });
      },
      child: AbsorbPointer(
        child: Column(children: [
          AnimatedButton(
            controller: controller,
            size: 36,
            switchOn: switchOn3,
            onTap: (switchOn) {
              print("btn3 switchOn: $switchOn");
            },
          ),
          Text("$favorCount3"),
        ]),
      ),
    );
  }

  bool switchOn4 = false;
  int favorCount4 = 3;

  Widget renderBtn4() {
    return AnimatedTextButton(
      text: "$favorCount4",
      size: 36,
      switchOn: switchOn4,
      orientation: WidgetOrientation.Horizontal,
      onTap: (switchOn) {
        setState(() {
          if (switchOn)
            favorCount4++;
          else
            favorCount4--;
        });
      },
    );
  }
}
