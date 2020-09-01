import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_food_app/model/FoodModel.dart';
import 'package:flutter_food_app/model/SweetModel.dart';
import 'package:flutter_food_app/view/FoodApp.dart';
import 'package:http/http.dart' as http;

abstract class FoodViewModel extends State<FoodApp> {
  final baseUrl = "https://foodapp-4df3e.firebaseio.com/";
  bool isLoading = false;
  List<SweetModel> sweetModelList = [];
  List<FoodModel> foodModelList = [];

  @override
  void initState() {
    super.initState();
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
    final response = await http.get("$baseUrl/foods.json");
    switch (response.statusCode) {
      case HttpStatus.ok:
        final jsonBody = jsonDecode(response.body);
        if (jsonBody is List)
          foodModelList = jsonBody.map((e) => FoodModel.fromJson(e)).toList();
        break;
      default:
    }
  }

  Future<void> getSweetList() async {
    final response = await http.get("$baseUrl/sweets.json");
    switch (response.statusCode) {
      case HttpStatus.ok:
        final jsonBody = jsonDecode(response.body);
        if (jsonBody is List)
          sweetModelList = jsonBody.map((e) => SweetModel.fromJson(e)).toList();
        break;
      default:
    }
  }
}
