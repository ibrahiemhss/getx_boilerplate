import 'package:flutter/material.dart';
import '../../config/theme/app_theme.dart';

class GradientCard extends StatelessWidget {
  final Widget? child;
  final bool needTopSafeArea;
  final bool needTopRadius;
  final bool islightTheme;

  GradientCard({
    Key? key,
    this.needTopSafeArea = true,
    this.needTopRadius = false,
    this.child,
    required this.islightTheme,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return needTopSafeArea
        ? Container(
            color: Theme.of(context).colorScheme.primary,
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
                stops: [0.1, 0.9],
                colors: AppTheme.gradient()),
          ),
          child: child,
        ),
      ],
    );
  }
}
