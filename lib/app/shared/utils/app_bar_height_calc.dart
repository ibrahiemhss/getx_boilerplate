import 'package:flutter/material.dart';

class AppBarHeightCalc {
  String title;
  double width;

  AppBarHeightCalc({
    required this.title,
    required this.width,
  });

  double horizontalPadding = 32;
  double actionsWidth = 48;
  final style = TextStyle(fontSize: 26);

  double calculateHeight() {
    TextPainter textPainter = TextPainter()
      ..text = TextSpan(text: title, style: style)
      ..textDirection = TextDirection.ltr
      ..layout(minWidth: 0, maxWidth: width - horizontalPadding);
    return (textPainter.size.height);
  }

  double calculateHeightWithActions() {
    TextPainter textPainter = TextPainter()
      ..text = TextSpan(text: title, style: style)
      ..textDirection = TextDirection.ltr
      ..layout(minWidth: 0, maxWidth: width - actionsWidth - horizontalPadding);
    return (textPainter.size.height);
  }
}
