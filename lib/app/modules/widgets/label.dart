import 'package:flutter/material.dart';

class Label extends StatelessWidget {
  const Label(
      {this.child,
      this.onPress,
      Key? key,
      this.height = 50,
      this.elevation = 2})
      : super(key: key);
  final Widget? child;
  final VoidCallback? onPress;
  final double? height;
  final double? elevation;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
        margin: const EdgeInsets.only(bottom: 8.0),
        color: Theme.of(context).cardTheme.color,
        height: height,
        child: Material(
          elevation: elevation!,
          child: child,
        ),
      ),
    );
  }
}
