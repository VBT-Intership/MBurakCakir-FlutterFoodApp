import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_food_app/model/FoodModel.dart';

class BuildFoodListView extends StatefulWidget {
  @override
  _BuildFoodListViewState createState() => _BuildFoodListViewState();

  BuildFoodListView(this.foodList);

  List<FoodModel> foodList;
}

class _BuildFoodListViewState extends State<BuildFoodListView> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: widget.foodList.length,
        itemBuilder: (context, position) {
          return Container(
              margin: EdgeInsets.fromLTRB(10, 0, 0, 0),
              color: Colors.white,
              child: buildCardListView(widget.foodList[position]));
        });
  }
}

Card buildCardListView(foodModel) {
  return Card(
      margin: EdgeInsets.fromLTRB(10, 0, 10, 10),
      child: Row(
        children: [
          buildCardImage(
              foodModel.url, Color((int.parse(foodModel.backgroundColor)))),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildTextTitle(foodModel.title),
              buildRowTags(foodModel),
              buildSizedBoxSubtitle(foodModel)
            ],
          )
        ],
      ));
}

Text buildTextTitle(text) {
  return Text(text,
      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold));
}

Row buildRowTags(foodModel) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Container(
          child: buildCardFeature(
              foodModel.hashtag1, Color(0xFFFAF2DA), Colors.orangeAccent)),
      Container(
          child: buildCardFeature(
              foodModel.hashtag2, Color(0xFFEFF6FE), Colors.blue))
    ],
  );
}

SizedBox buildSizedBoxSubtitle(foodModel) {
  return SizedBox(
      width: 250,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
              margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
              child: Text(
                foodModel.owner,
                style: TextStyle(color: Colors.grey[400]),
              )),
          Container(
            margin: EdgeInsets.fromLTRB(0, 0, 10, 0),
            child: Text(
              foodModel.rp,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          )
        ],
      ));
}

Card buildCardFeature(text, Color colorBackground, Color colorText) {
  return Card(
      color: colorBackground,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      child: (Padding(
        padding: EdgeInsets.all(5),
        child: Text(text, style: TextStyle(color: colorText)),
      )));
}

Card buildCardImage(list, color) {
  return Card(
      color: color,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      elevation: 5,
      margin: EdgeInsets.all(10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
          padding: EdgeInsets.all(8),
          child: Image.network(
            list,
            height: 60,
            width: 60,
          )));
}

Card buildClipRRect(imageList, colorList) {
  return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      margin: EdgeInsets.fromLTRB(7, 7, 7, 7),
      color: colorList,
      child: Container(
          padding: EdgeInsets.all(5),
          child: ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.network(
                imageList,
                height: 125,
                width: 125,
              ))));
}
