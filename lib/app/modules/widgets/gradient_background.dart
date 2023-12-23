import 'package:flutter/material.dart';
import 'package:getx_boilerplate/app/modules/widgets/svg_background.dart';
import '../../config/theme/app_theme.dart';

class GradientBackground extends StatelessWidget {
  final bool needSvg;
  final Widget? child;
  final bool needTopSafeArea;
  final bool needTopRadius;

  GradientBackground({
    Key? key,
    this.needSvg = true,
    this.needTopSafeArea = true,
    this.needTopRadius = false,
    this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return needTopSafeArea
        ? Container(
            child: SafeArea(
              child: _buildBackground(context),
            ),
          )
        : _buildBackground(context);
  }

  Widget _buildBackground(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: needTopRadius
                ? BorderRadius.only(
                    topLeft: Radius.circular(25.0),
                    topRight: Radius.circular(25.0),
                  )
                : null,
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                stops: [0.1, 0.3, 0.5, 0.9],
                colors: AppTheme.gradient()),
          ),
          child: child,
        ),
        if (needSvg) SvgBackground(),
      ],
    );
  }
}
