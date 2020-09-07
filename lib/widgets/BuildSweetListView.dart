import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_food_app/enums/EnumConstants.dart';
import 'package:flutter_food_app/model/SweetModel.dart';

class BuildSweetListView extends StatefulWidget {
  @override
  _BuildSweetListViewState createState() => _BuildSweetListViewState();

  BuildSweetListView(this.sweetList);

  List<SweetModel> sweetList;
}

double margin;

class _BuildSweetListViewState extends State<BuildSweetListView> {
  @override
  Widget build(BuildContext context) {
    margin = MediaQuery.of(context).size.width * 0.02;
    return ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: widget.sweetList.length,
        itemBuilder: (context, position) {
          return Container(
              margin: EdgeInsets.fromLTRB(margin, 0, 0, 0),
              color: Colors.white,
              child: buildColumnSweetList(widget.sweetList[position]));
        });
  }
}

Column buildColumnSweetList(sweetModel) {
  return Column(
    children: [
      buildCardClipRRect(
          sweetModel.url, Color((int.parse(sweetModel.colorCode)))),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(sweetModel.category,
              style: TextStyle(
                  color: CupertinoColors.inactiveGray,
                  fontWeight: FontWeight.bold)),
          Text(sweetModel.countItem.toString() + " items",
              style: TextStyle(fontWeight: FontWeight.bold))
        ],
      )
    ],
  );
}

Card buildCardClipRRect(imageUrl, cardColor) {
  return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      margin: EdgeInsets.fromLTRB(margin, margin, margin, margin),
      color: cardColor,
      child: Container(
          padding: EdgeInsets.all(margin / 2),
          child: ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.network(
                imageUrl,
                height: Constants.imageHeight.size,
                width: Constants.imageWidth.size,
              ))));
}
