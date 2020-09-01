import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_food_app/model/FoodModel.dart';
import 'package:flutter_food_app/model/SweetModel.dart';
import 'package:flutter_food_app/widgets/BuildFoodListView.dart';
import 'package:flutter_food_app/widgets/BuildSweetListView.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen(this.sweetListModel, this.foodListModel);

  final List<SweetModel> sweetListModel;
  final List<FoodModel> foodListModel;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Material App',
        home: Scaffold(
          appBar: AppBar(
              backgroundColor: Colors.white, actions: [buildRowAppBar()]),
          body: Container(
            padding: EdgeInsets.all(10),
            child: Column(
              children: [
                Expanded(flex: 1, child: (buildRowHeader())),
                Expanded(flex: 2, child: BuildSweetListView(sweetListModel)),
                Expanded(flex: 1, child: (buildColumnPopular())),
                Expanded(flex: 3, child: BuildFoodListView(foodListModel))
              ],
            ),
          ),
        ));
  }

  Container buildRowHeader() {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
      child: Row(
        children: [
          Text("What do you want\nto eat today?",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
          buildCardIcon(Icons.search, Colors.white, Colors.black)
        ],
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
      ),
    );
  }

  Card buildCardIcon(icon, color, iconColor) {
    return Card(
        color: color,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        elevation: 5,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Padding(
            padding: EdgeInsets.all(12), child: Icon(icon, color: iconColor)));
  }

  Container buildColumnPopular() {
    return Container(
        alignment: Alignment.center,
        child: ListTile(
            title: Text("Popular",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
            subtitle: Text("Moniggo, falan filan",
                style: TextStyle(color: CupertinoColors.inactiveGray)),
            leading: buildCardIcon(Icons.favorite, Colors.red, Colors.white),
            trailing: Icon(Icons.arrow_forward, color: Colors.black)));
  }

  Expanded buildRowAppBar() {
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
