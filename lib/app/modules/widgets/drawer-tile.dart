import 'package:flutter/material.dart';

const TextColor = Color.fromRGBO(50, 50, 93, 1.0);

class DrawerTile extends StatelessWidget {
  final String title;
  final IconData icon;

  //final Function onTap;
  final onTap;
  final bool isSelected;
  final Color iconColor;

  const DrawerTile(
      {required this.title,
      required this.icon,
      this.onTap,
      this.isSelected = false,
      this.iconColor = TextColor});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(top:8),
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
              //color: isSelected ? PrimaryColor : WhiteColor,
              borderRadius: BorderRadius.all(Radius.circular(8))),
          child: Row(
            children: [
              Icon(
                icon, size: 24,
                //color: isSelected ? WhiteColor : iconColor
                color: Theme.of(context).iconTheme.color,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0,right: 8.0),
                child:
                    Text(title, style: Theme.of(context).textTheme.titleSmall),
              )
            ],
          )),
    );
  }
}
