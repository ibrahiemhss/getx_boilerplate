import 'package:flutter/material.dart';
import '../../shared/constants/colors.dart';

class BorderButton extends StatelessWidget {
  final _GradientPainter gradientPainter;
  final listGradientColors;
  final String text;
  Widget? child = Container();
  final VoidCallback? callback;
  final double? radius;
  final Color backgroundColor;
  final TextStyle? txtStyle;
  final double? minWidth;
  final double? minHeight;
  final double? strokeWidth;
  final Gradient? gradient;

  BorderButton({
    this.strokeWidth = 1,
    this.radius = 22,
    this.gradient,
    this.text = "",
    this.child,
    this.callback,
    this.listGradientColors,
    this.minWidth = 88,
    this.minHeight = 64,
    this.txtStyle,
    this.backgroundColor = Colors.transparent,
  }) : this.gradientPainter = _GradientPainter(
          strokeWidth: strokeWidth!,
          radius: radius!,
          gradient: gradient ??
              LinearGradient(
                colors: listGradientColors == null
                    ? ColorConstants.gradientLight
                    : listGradientColors,
              ),
        );

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: gradientPainter,
      child: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: callback,
        child: InkWell(
          borderRadius: BorderRadius.circular(radius!),
          onTap: callback,
          child: Container(
            decoration: BoxDecoration(
                color: this.backgroundColor,
                borderRadius: BorderRadius.circular(this.radius!)),
            constraints: BoxConstraints(
                minWidth: this.minWidth!, minHeight: this.minHeight!),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  text,
                  style: txtStyle ?? Theme.of(context).textTheme.labelSmall,
                ),
                child == null ? Container() : child!,
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _GradientPainter extends CustomPainter {
  final Paint _paint = Paint();
  final double radius;
  final double strokeWidth;
  final Gradient gradient;

  _GradientPainter({
    required double strokeWidth,
    required double radius,
    required Gradient gradient,
  })  : this.strokeWidth = strokeWidth,
        this.radius = radius,
        this.gradient = gradient;

  @override
  void paint(Canvas canvas, Size size) {
    // create outer rectangle equals size
    Rect outerRect = Offset.zero & size;
    var outerRRect =
        RRect.fromRectAndRadius(outerRect, Radius.circular(radius));

    // create inner rectangle smaller by strokeWidth
    Rect innerRect = Rect.fromLTWH(strokeWidth, strokeWidth,
        size.width - strokeWidth * 2, size.height - strokeWidth * 2);
    var innerRRect = RRect.fromRectAndRadius(
        innerRect, Radius.circular(radius - strokeWidth));

    // apply gradient shader
    _paint.shader = gradient.createShader(outerRect);

    // create difference between outer and inner paths and draw it
    Path path1 = Path()..addRRect(outerRRect);
    Path path2 = Path()..addRRect(innerRRect);
    var path = Path.combine(PathOperation.difference, path1, path2);
    canvas.drawPath(path, _paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => oldDelegate != this;
}
