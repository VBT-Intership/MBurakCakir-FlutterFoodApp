import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BuildAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Row(
      children: [
        IconButton(
            icon: Icon(Icons.arrow_back_ios),
            color: Colors.black,
            onPressed: () {}),
        Spacer(),
        IconButton(
            icon: Icon(Icons.subject), color: Colors.black, onPressed: () {})
      ],
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
    ));
  }
}
