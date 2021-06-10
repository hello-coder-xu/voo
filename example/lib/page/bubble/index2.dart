import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:voo/bubble/index.dart';

class BubbleBoxPage2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        title: Text("BubbleBox Demo"),
      ),
      body: Center(
        child: TextButton(
          onPressed: () => showBubbleDialog(context),
          style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.blue)),
          child: Text(
            "点击",
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }

  void showBubbleDialog(BuildContext context) {
    showGeneralDialog(
      context: context,
      barrierColor: Colors.black.withOpacity(0.2),
      barrierDismissible: true,
      barrierLabel: '',
      transitionBuilder: (context, a1, a2, widget) {
        final curvedValue = 1.0 - Curves.easeIn.transform(a1.value);
        return Transform(
          transform: Matrix4.translationValues(0.0, curvedValue * 20, 0.0),
          child: Opacity(
            opacity: a1.value,
//            child: renderBubbleDialog(context),
            child: BubbleDialog(),
          ),
        );
      },
      transitionDuration: Duration(milliseconds: 200),
      pageBuilder: (context, animation1, animation2) {
        return Center();
      },
    );
  }

  Widget renderBubbleDialog(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 70),
      alignment: Alignment.center,
      child: Dialog(
        backgroundColor: Colors.transparent,
        elevation: 0,
        child: BubbleBox(
          radius: Radius.circular(4),
          padding: EdgeInsets.zero,
          arrowDirection: ArrowDirection.bottom,
          arrowAlignment: ArrowAlignment.center,
          width: 80,
          height: 80,
          child: Column(children: [
            SizedBox(
              height: 40,
              child: TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(
                  "最新",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            SizedBox(
              height: 40,
              child: TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(
                  "最热",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}

class BubbleDialog extends Dialog {
  @override
  Widget build(BuildContext context) {
    return AnimatedPadding(
      padding: MediaQuery.of(context).viewInsets + const EdgeInsets.symmetric(horizontal: 40.0, vertical: 24.0),
      duration: insetAnimationDuration,
      curve: insetAnimationCurve,
      child: MediaQuery.removeViewInsets(
        removeLeft: true,
        removeTop: true,
        removeRight: true,
        removeBottom: true,
        context: context,
        child: Container(
          padding: EdgeInsets.only(bottom: 70),
          alignment: Alignment.center,
          child: BubbleBox(
            radius: Radius.circular(4),
            padding: EdgeInsets.zero,
            arrowDirection: ArrowDirection.bottom,
            arrowAlignment: ArrowAlignment.center,
            width: 80,
            height: 80,
            child: Column(children: [
              SizedBox(
                height: 40,
                child: TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    "最新",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              SizedBox(
                height: 40,
                child: TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    "最热",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
