import 'package:flutter/material.dart';

class AppPopupMenuEntry extends PopupMenuEntry<String> {
  final String value;
  final String title;
  final ValueChanged<String>? onSelectedCallback;

  AppPopupMenuEntry({
    required this.value,
    required this.title,
    this.onSelectedCallback,
  });

  @override
  double get height => kMinInteractiveDimension;

  @override
  bool represents(String? value) => value == this.value;

  @override
  AppPopupMenuEntryState createState() => AppPopupMenuEntryState();
}

class AppPopupMenuEntryState extends State<AppPopupMenuEntry> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).backgroundColor,
      child: InkWell(
        onTap: () {
          Navigator.pop(context, widget.value);
          widget.onSelectedCallback?.call(widget.value);
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            widget.title,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ),
      ),
    );
  }
}

class AppPopupMenu extends StatelessWidget {
  final String title;
  final List<AppPopupMenuEntry> entries;
  final ValueChanged<String>? onSelectedCallback;

  AppPopupMenu({
    required this.title,
    required this.entries,
    this.onSelectedCallback,
  });

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      onSelected: onSelectedCallback,
      itemBuilder: (BuildContext context) => entries,
      icon: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          shape: BoxShape.circle,
        ),
        child: Icon(
          Icons.more_vert,
          color: Colors.white,
        ),
      ),
    );
  }
}
