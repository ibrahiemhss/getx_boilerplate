import 'package:flutter/material.dart';
import 'package:getx_boilerplate/app/modules/widgets/responsive_text.dart';

class HeaderText extends StatelessWidget {
  const HeaderText({required this.txt, Key? key}) : super(key: key);

  final String txt;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 8.0, right: 8),
      child: ResponsiveText(
        text: txt,
        textAlign: TextAlign.right,
        style: Theme.of(context).textTheme.titleLarge!.copyWith(fontSize: 18),
      ),
    );
  }
}
