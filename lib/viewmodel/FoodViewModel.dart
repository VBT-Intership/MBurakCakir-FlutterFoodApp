import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_food_app/model/FoodModel.dart';
import 'package:flutter_food_app/model/SweetModel.dart';
import 'package:flutter_food_app/service/AppService.dart';
import 'package:flutter_food_app/service/IAppService.dart';
import 'package:flutter_food_app/view/FoodApp.dart';

abstract class FoodViewModel extends State<FoodApp> {
  final baseUrl = "https://foodapp-4df3e.firebaseio.com/";
  bool isLoading = false;
  List<SweetModel> sweetModelList = [];
  List<FoodModel> foodModelList = [];
  IAppService appService;

  @override
  void initState() {
    super.initState();
    appService = AppService();
    callItems();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future<void> callItems() async {
    changeLoading();
    await getFoodList();
    await getSweetList();
    changeLoading();
    checkErrorList();
  }

  void checkErrorList() {
    if (sweetModelList.isEmpty || foodModelList.isEmpty) {
      showDialog(
        context: context,
        builder: (context) => Dialog(
          child: Text(".statusCode.toString()"),
        ),
      );
    }
  }

  void changeLoading() {
    setState(() {
      isLoading = !isLoading;
    });
  }

  Future<void> getFoodList() async {
    foodModelList = await appService.getFoodList();
  }

  Future<void> getSweetList() async {
    sweetModelList = await appService.getSweetList();
  }
}
