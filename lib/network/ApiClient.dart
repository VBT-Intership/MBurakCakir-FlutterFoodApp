import 'dart:convert';

import 'package:flutter_food_app/model/FoodModel.dart';
import 'package:flutter_food_app/model/SweetModel.dart';
import 'package:http/http.dart' as http;

class ConnectionAPI {
  Future<List<SweetModel>> getSweetList() async {
    final response =
        await http.get('https://foodapp-4df3e.firebaseio.com/sweets.json');
    List sweetModelList = List<SweetModel>();
    SweetModel sweetModel;
    if (response.statusCode == 200) {
      List<dynamic> liste = json.decode(response.body);
      for (int i = 0; i < liste.length; i++) {
        sweetModel = SweetModel.fromJson(json.decode(response.body)[i]);
        sweetModelList.add(sweetModel);
      }
    } else {
      print("error : " + response.statusCode.toString());
    }
    return sweetModelList;
  }

  Future<List<FoodModel>> getFoodList() async {
    final response = await http.get(
        'https://foodapp-4df3e.firebaseio.com/foods.json');
    List<FoodModel> foodModelList = new List();
    FoodModel foodModel;
    if (response.statusCode == 200) {
      List<dynamic> jsonListesi = json.decode(response.body);
      for (int i = 0; i < jsonListesi.length; i++) {
        foodModel = FoodModel.fromJson(json.decode(response.body)[i]);
        foodModelList.add(foodModel);
      }
    } else {
      print("error : " + response.statusCode.toString());
    }
    return foodModelList;
  }
}
