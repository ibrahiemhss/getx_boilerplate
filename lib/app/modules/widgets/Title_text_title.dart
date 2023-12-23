import 'package:flutter/material.dart';

class TitleText extends StatelessWidget {
  const TitleText({required this.txt, Key? key}) : super(key: key);

  final String txt;

  @override
  Widget build(BuildContext context) {
    ThemeData currentTheme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        txt,
        style: Theme.of(context).textTheme.titleLarge,
      ),
    );
  }
}
