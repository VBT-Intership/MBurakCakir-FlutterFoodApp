import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BuildCardIcon extends StatefulWidget {
  BuildCardIcon(this.icon, this.cardColor, this.iconColor);

  Color cardColor;
  Color iconColor;
  IconData icon;

  @override
  _BuildCardIconState createState() => _BuildCardIconState();
}

class _BuildCardIconState extends State<BuildCardIcon> {
  double width;

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width * 0.03;
    return Card(
        color: widget.cardColor,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        elevation: 5,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(width)),
        child: Padding(
            padding: EdgeInsets.all(width),
            child: Icon(widget.icon, color: widget.iconColor)));
  }
}
