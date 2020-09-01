import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_food_app/model/FoodModel.dart';
import 'package:flutter_food_app/model/SweetModel.dart';
import 'package:flutter_food_app/widgets/BuildAppBar.dart';
import 'package:flutter_food_app/widgets/BuildCardIcon.dart';
import 'package:flutter_food_app/widgets/BuildFoodListView.dart';
import 'package:flutter_food_app/widgets/BuildHeader.dart';
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
          appBar:
              AppBar(backgroundColor: Colors.white, actions: [BuildAppBar()]),
          body: Container(
            padding: EdgeInsets.all(10),
            child: Column(
              children: [
                Expanded(flex: 1, child: (BuildHeader())),
                Expanded(flex: 2, child: BuildSweetListView(sweetListModel)),
                Expanded(flex: 1, child: (buildRowPopular())),
                Expanded(flex: 3, child: BuildFoodListView(foodListModel))
              ],
            ),
          ),
        ));
  }

  Container buildRowPopular() {
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
