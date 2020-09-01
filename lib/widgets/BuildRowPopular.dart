import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'BuildCardIcon.dart';

class BuildRowPopular extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        child: ListTile(
            title: Text("Popular",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
            subtitle: Text("Moniggo, falan filan",
                style: TextStyle(color: CupertinoColors.inactiveGray)),
            leading: BuildCardIcon(Icons.favorite, Colors.red, Colors.white),
            trailing: Icon(Icons.arrow_forward, color: Colors.black)));
  }
}
