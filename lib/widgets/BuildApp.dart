import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_food_app/model/FoodModel.dart';
import 'package:flutter_food_app/model/SweetModel.dart';

import 'BuildAppBar.dart';
import 'BuildFoodListView.dart';
import 'BuildHeader.dart';
import 'BuildRowPopular.dart';
import 'BuildSweetListView.dart';

class BuildApp extends StatelessWidget {
  BuildApp(this.sweetListModel, this.foodListModel);

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
                Expanded(flex: 1, child: BuildHeader()),
                Expanded(flex: 2, child: BuildSweetListView(sweetListModel)),
                Expanded(flex: 1, child: BuildRowPopular()),
                Expanded(flex: 3, child: BuildFoodListView(foodListModel))
              ],
            ),
          ),
        ));
  }
}
