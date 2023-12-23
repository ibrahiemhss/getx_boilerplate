import 'package:flutter/material.dart';

class SubTitleText extends StatelessWidget {
  const SubTitleText({required this.txt, Key? key}) : super(key: key);

  final String txt;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Text(
        txt,
        style: Theme.of(context).textTheme.bodySmall,
      ),
    );
  }
}
