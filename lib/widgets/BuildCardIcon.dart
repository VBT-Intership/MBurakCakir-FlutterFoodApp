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
  @override
  Widget build(BuildContext context) {
    return Card(
        color: widget.cardColor,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        elevation: 5,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Padding(
            padding: EdgeInsets.all(12),
            child: Icon(widget.icon, color: widget.iconColor)));
  }
}
