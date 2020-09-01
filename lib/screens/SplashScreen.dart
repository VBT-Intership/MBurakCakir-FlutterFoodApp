import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_food_app/model/FoodModel.dart';
import 'package:flutter_food_app/model/SweetModel.dart';

import '../network/ApiClient.dart';
import 'HomeScreen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    getLists();
  }

  Future<void> getLists() async {
    ConnectionAPI connection = ConnectionAPI();
    List<SweetModel> sweetList = await connection.getSweetList();
    List<FoodModel> foodList = await connection.getFoodList();

    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => HomeScreen(sweetList, foodList)));
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
