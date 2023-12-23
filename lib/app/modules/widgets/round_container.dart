import 'package:flutter/material.dart';

class RoundContainer extends StatelessWidget {
  const RoundContainer({
    this.child,
    this.elevation = 5,
    this.circular = 30.0,
    this.color = Colors.white,
    this.width,
    this.margin,
    this.height,
    Key? key,
  }) : super(key: key);
  final Widget? child;
  final double? elevation;
  final double? circular;
  final Color? color;
  final double? width;
  final double? height;
  final EdgeInsets? margin;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: color!,
        borderRadius: BorderRadius.circular(circular!),
      ),
      child: child,
    );
  }
}
