import 'package:flutter/material.dart';

///
class VooFilterView extends StatefulWidget {
  final Widget child;
  final Offset offset;
  final VoidCallback? close;

  VooFilterView({
    required this.child,
    this.offset = Offset.zero,
    this.close,
  });

  @override
  VooFilterViewState createState() => VooFilterViewState();
}

class VooFilterViewState extends State<VooFilterView> with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation animation;
  late Animation animationFade;

  void initState() {
    super.initState();
    animationController = AnimationController(vsync: this, duration: const Duration(milliseconds: 250));
    animation = Tween(begin: 0.0, end: 1.0).animate(animationController);
    animationFade = CurvedAnimation(parent: animationController, curve: Curves.fastOutSlowIn);
    animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> children = [];
    children.add(Divider(height: 1));
    children.add(AnimatedBuilder(
      animation: animationController,
      builder: (context, child) {
        return SizeTransition(
          axis: Axis.vertical,
          sizeFactor: animation as Animation<double>,
          child: child,
        );
      },
      child: widget.child,
    ));
    children.add(Expanded(
      child: AnimatedBuilder(
        animation: animationController,
        builder: (context, child) {
          return FadeTransition(
            opacity: animationFade as Animation<double>,
            child: child,
          );
        },
        child: GestureDetector(
          onTap: close,
          child: ConstrainedBox(
            constraints: const BoxConstraints.expand(),
            child: DecoratedBox(
              decoration: BoxDecoration(color: Colors.black45),
            ),
          ),
        ),
      ),
    ));
    return Container(
      margin: EdgeInsets.only(top: widget.offset.dy),
      child: Column(children: children),
    );
  }

  void close() async {
    await animationController.reverse();
    if (widget.close != null) {
      widget.close!();
    }
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }
}
