import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_food_app/widgets/BuildCardIcon.dart';

class BuildHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
      child: Row(
        children: [
          Text("What do you want\nto eat today?",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
          BuildCardIcon(Icons.search, Colors.white, Colors.black)
        ],
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
      ),
    );
  }
}
