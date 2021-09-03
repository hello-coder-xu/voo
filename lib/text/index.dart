import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

const double DEFAULT_FONT_SIZE = 14;

class ExpandableText extends StatefulWidget {
  final int maxLines;
  final String text;
  final TextStyle textStyle;
  final String expandText;
  final TextStyle expandTextStyle;

  ExpandableText({
    Key? key,
    required this.text,
    this.textStyle = const TextStyle(
      color: Colors.black,
      fontSize: DEFAULT_FONT_SIZE,
    ),
    this.expandText = "查看更多",
    this.expandTextStyle = const TextStyle(
      color: Colors.blue,
      fontSize: DEFAULT_FONT_SIZE,
    ),
    this.maxLines = 1,
  }) : super(key: key);

  @override
  _ExpandableTextState createState() => _ExpandableTextState();
}

class _ExpandableTextState extends State<ExpandableText> {
  bool isExpand = false;
  final String hintText = "...  ";

  /// 根据文本和最大宽度获取 TextPainter，用于判断渲染后的行数和是否超过设置的最大行数等
  TextPainter getTextPaint(String text) {
    TextSpan textSpan = TextSpan(
      text: text,
      style: widget.textStyle,
    );
    TextPainter textPaint = TextPainter(
      text: textSpan,
      maxLines: widget.maxLines,
      textDirection: TextDirection.ltr,
    );
    return textPaint;
  }

  Widget renderExceedText(double maxWidth) {
    TextPainter textPaint1 = getTextPaint(widget.text);
    textPaint1.layout(maxWidth: maxWidth);
    if (isExpand) return Text(widget.text, style: widget.textStyle);

    // 获取当前的文本
    String _text = widget.text;
    // 获取当前文本总的行数
    int textLines1 = textPaint1.computeLineMetrics().length;
    // 获取平均每行的字符数
    int textEachLine = widget.text.length ~/ textLines1;
    // 三行总子字符数
    int textLength = textEachLine * widget.maxLines;

    // 省略号 和 查看更多按钮
    String appendHintText = hintText + widget.expandText;

    int firstExceed = 0;
    bool clipText = true;
    // 对超出的部分进行剪切
    while (clipText) {
      String text = widget.text.substring(0, textLength + 1) + appendHintText;
      TextPainter textPaint = getTextPaint(text);
      textPaint.layout(maxWidth: maxWidth);
      if (firstExceed == 0) firstExceed = textPaint.didExceedMaxLines ? 1 : 2;
      // Whether text string exceed max lines
      // 文本是否超过设置的最大行数
      bool exceed = textPaint.didExceedMaxLines;
      // 如果第一次循环，文本超过最大行数
      if (firstExceed == 1) {
        // 超过最大行数，则每次减少一个字符串长度，直至刚好不超过为止
        if (exceed) {
          textLength--;
        } else {
          clipText = false;
        }
      }
      // 如果第一次循环，文本没有超过最大行数
      if (firstExceed == 2) {
        // 不超过最大行数，则每次增加一个字符串长度，直至刚好超过为止
        if (exceed) {
          clipText = false;
        } else {
          textLength++;
        }
      }
    }

    _text = widget.text.substring(0, textLength);
    return RichText(
      strutStyle: StrutStyle.fromTextStyle(widget.textStyle),
      text: TextSpan(
        text: "$_text$hintText",
        style: widget.textStyle,
        children: <TextSpan>[createExpandBtn()],
      ),
    );
  }

  TextSpan createExpandBtn() {
    return TextSpan(
      recognizer: TapGestureRecognizer()
        ..onTap = () {
          setState(() => this.isExpand = true);
        },
      text: "${widget.expandText}",
      style: widget.expandTextStyle,
    );
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return renderExceedText(constraints.maxWidth);
      },
    );
  }
}

typedef OnButtonTap = Function(bool isExpand);

class ExpandableIconText extends StatefulWidget {
  final String text;
  final TextStyle style;
  final Widget? expandButton;
  final Widget? collapseButton;
  final int maxLines;
  final bool isExpand;
  final OnButtonTap? onButtonTap;

  const ExpandableIconText({
    Key? key,
    required this.text,
    this.style = const TextStyle(),
    this.expandButton,
    this.collapseButton,
    this.maxLines = 3,
    this.isExpand = false,
    this.onButtonTap,
  }) : super(key: key);

  @override
  _ExpandableIconTextState createState() => _ExpandableIconTextState();
}

class _ExpandableIconTextState extends State<ExpandableIconText> {
  bool isExpand = false;

  @override
  void initState() {
    super.initState();
    isExpand = widget.isExpand;
  }

  bool didExceedMaxLines(double maxWidth) {
    TextSpan textSpan = TextSpan(
      text: widget.text,
      style: widget.style,
    );
    TextPainter textPaint = TextPainter(
      text: textSpan,
      maxLines: widget.maxLines,
      textDirection: TextDirection.ltr,
    );
    textPaint.layout(maxWidth: maxWidth);
    return textPaint.didExceedMaxLines;
  }

  Widget renderExpandableText(double maxWidth) {
    Widget child = Text(widget.text, style: widget.style);
    if (didExceedMaxLines(maxWidth)) {
      child = Column(
        children: <Widget>[
          renderText(),
          SizedBox(height: 8),
          renderButton(),
        ],
      );
    }
    return child;
  }

  Widget renderText() {
    Widget child = Text(
      widget.text,
      style: widget.style,
      maxLines: widget.maxLines,
      overflow: TextOverflow.ellipsis,
    );
    if (isExpand) child = Text(widget.text, style: widget.style);
    return child;
  }

  Widget renderButton() {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        setState(() => isExpand = !isExpand);
        if (widget.onButtonTap != null) widget.onButtonTap!(isExpand);
      },
      child: isExpand ? defaultCollapseButton() : defaultExpandButton(),
    );
  }

  Widget defaultCollapseButton() {
    return Icon(Icons.keyboard_arrow_up);
  }

  Widget defaultExpandButton() {
    return Icon(Icons.keyboard_arrow_down);
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return renderExpandableText(constraints.maxWidth);
      },
    );
  }
}
