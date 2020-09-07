import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_food_app/model/FoodModel.dart';

class BuildFoodListView extends StatefulWidget {
  @override
  _BuildFoodListViewState createState() => _BuildFoodListViewState();

  BuildFoodListView(this.foodList);

  List<FoodModel> foodList;
}

double margin;

class _BuildFoodListViewState extends State<BuildFoodListView> {
  @override
  Widget build(BuildContext context) {
    margin = MediaQuery.of(context).size.width * 0.02;
    return ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: widget.foodList.length,
        itemBuilder: (context, position) {
          return Container(
              margin: EdgeInsets.fromLTRB(margin, 0, 0, 0),
              color: Colors.white,
              child: buildCardFoodList(widget.foodList[position]));
        });
  }
}

Card buildCardFoodList(foodModel) {
  return Card(
      margin: EdgeInsets.fromLTRB(margin, 0, margin, margin),
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

Card buildCardFoodImage(imageUrl, cardColor) {
  return Card(
      color: cardColor,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      elevation: 5,
      margin: EdgeInsets.all(margin),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
          padding: EdgeInsets.all(margin),
          child: Image.network(
            imageUrl,
            height: 60,
            width: 60,
          )));
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

Card buildCardFoodHashtag(text, cardColor, colorText) {
  return Card(
      color: cardColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      child: (Padding(
        padding: EdgeInsets.all(margin / 2),
        child: Text(text, style: TextStyle(color: colorText)),
      )));
}

SizedBox buildSizedBoxSubtitle(foodModel) {
  return SizedBox(
      width: 250,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
              margin: EdgeInsets.fromLTRB(0, margin, 0, 0),
              child: Text(
                foodModel.owner,
                style: TextStyle(color: Colors.grey[400]),
              )),
          Container(
            margin: EdgeInsets.fromLTRB(0, margin, margin, 0),
            child: Text(
              foodModel.rp,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          )
        ],
      ));
}
