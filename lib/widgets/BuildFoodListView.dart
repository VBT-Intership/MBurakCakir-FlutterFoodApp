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
              child: buildCardFoodList(widget.foodList[position]));
        });
  }
}

Card buildCardFoodList(foodModel) {
  return Card(
      margin: EdgeInsets.fromLTRB(10, 0, 10, 10),
      child: Row(
        children: [
          buildCardFoodImage(
              foodModel.url, Color((int.parse(foodModel.backgroundColor)))),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildTextTitle(foodModel.title),
              buildRowFoodTags(foodModel),
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

Row buildRowFoodTags(foodModel) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Container(
          child: buildCardFoodHashtag(
              foodModel.hashtag1, Color(0xFFFAF2DA), Colors.orangeAccent)),
      Container(
          child: buildCardFoodHashtag(
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

Card buildCardFoodHashtag(text, cardColor, colorText) {
  return Card(
      color: cardColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      child: (Padding(
        padding: EdgeInsets.all(5),
        child: Text(text, style: TextStyle(color: colorText)),
      )));
}

Card buildCardFoodImage(imageUrl, cardColor) {
  return Card(
      color: cardColor,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      elevation: 5,
      margin: EdgeInsets.all(10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
          padding: EdgeInsets.all(8),
          child: Image.network(
            imageUrl,
            height: 60,
            width: 60,
          )));
}