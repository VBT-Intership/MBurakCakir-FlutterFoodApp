import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_food_app/model/FoodModel.dart';
import 'package:flutter_food_app/model/SweetModel.dart';
import 'package:flutter_food_app/widgets/BuildApp.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen(this.sweetListModel, this.foodListModel);

  final List<SweetModel> sweetListModel;
  final List<FoodModel> foodListModel;

  @override
  Widget build(BuildContext context) {
    return BuildApp(sweetListModel, foodListModel);
  }
}
