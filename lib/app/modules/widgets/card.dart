import 'package:flutter/material.dart';

class CardLabel extends StatelessWidget {
  const CardLabel(
      {this.child, this.elevation = 5, this.circular = 10, Key? key})
      : super(key: key);
  final Widget? child;
  final double? elevation;
  final double? circular;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: elevation,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(circular!), //<-- SEE HERE
      ),
      child: Container(
        child: child,
      ),
    );
  }
}
