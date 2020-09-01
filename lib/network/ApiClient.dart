import 'dart:convert';

import 'package:flutter_food_app/model/FoodModel.dart';
import 'package:flutter_food_app/model/SweetModel.dart';
import 'package:http/http.dart' as http;

class ConnectionAPI {
  Future<List<SweetModel>> getSweetList() async {
    final response =
        await http.get('https://foodapp-4df3e.firebaseio.com/sweets.json');
    List sweetModelList = List<SweetModel>();
    if (response.statusCode == 200) {
      List<dynamic> liste = json.decode(response.body);
      for (int i = 0; i < liste.length; i++) {
        SweetModel tempModel =
            SweetModel.fromJson(json.decode(response.body)[i]);
        sweetModelList.add(tempModel);
      }
    } else {
      print("error : " + response.statusCode.toString());
    }
    return sweetModelList;
  }

  Future<List<FoodModel>> getFoodList() async {
    var url = "https://foodapp-4df3e.firebaseio.com/foods.json";
    var response = await http.get(url);

    List<FoodModel> foodModelList = new List();
    if (response.statusCode == 200) {
      List<dynamic> jsonListesi = json.decode(response.body);
      for (int i = 0; i < jsonListesi.length; i++) {
        FoodModel tempModel = FoodModel.fromJson(json.decode(response.body)[i]);
        foodModelList.add(tempModel);
      }
    } else {
      print("error : " + response.statusCode.toString());
    }
    return foodModelList;
  }
}
