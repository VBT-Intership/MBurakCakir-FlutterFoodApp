import 'dart:convert';
import 'dart:io';

import 'package:flutter_food_app/model/BaseModel.dart';
import 'package:flutter_food_app/model/ErrorModel.dart';
import 'package:flutter_food_app/model/FoodModel.dart';
import 'package:flutter_food_app/model/SweetModel.dart';
import 'package:flutter_food_app/model/TaskModel.dart';
import 'package:http/http.dart' as http;

import 'IAppService.dart';

class AppService extends IAppService {
  final baseUrl = "https://foodapp-4df3e.firebaseio.com/";
  final baseUrl2 = "https://jsonplaceholder.typicode.com/";

  // @override
  // Future<List<FoodModel>> getFoodList() async {
  //   try {
  //     final response = await http.get("$baseUrl/foods.json");
  //     switch (response.statusCode) {
  //       case HttpStatus.ok:
  //         final jsonBody = jsonDecode(response.body);
  //         return jsonBody
  //             .map((e) => FoodModel.fromJson(e))
  //             .cast<FoodModel>()
  //             .toList();
  //       default:
  //     }
  //   } catch (e) {
  //     throw ErrorModel("Not found");
  //   }
  // }

  @override
  Future<List<SweetModel>> getSweetList() async {
    return await httpGet<SweetModel>("$baseUrl/sweets.json", SweetModel());
  }

  Future<List<FoodModel>> getFoodList() async {
    return await httpGet("$baseUrl/foods.json", FoodModel());
  }

  @override
  Future<List<TaskModel>> getTaskList() async {
    return await httpGet("$baseUrl2/todos.json", TaskModel());
  }

  Future<dynamic> httpGet<T extends BaseModel>(String path, T model) async {
    try {
      final response = await http.get(path);
      if (response is http.Response) {
        switch (response.statusCode) {
          case HttpStatus.ok:
            return _bodyParser<T>(response.body, model);
          default:
            throw ErrorModel(response.body);
        }
      }
    } catch (e) {
      return ErrorModel("see");
    }
  }

  dynamic _bodyParser<T extends BaseModel>(String body, BaseModel model) {
    final jsonBody = jsonDecode(body);

    print("Hello");

    if (jsonBody is List) {
      return jsonBody.map((e) => model.fromJson(e)).cast<T>().toList();
    } else if (jsonBody is Map) {
      return model.fromJson(jsonBody);
    } else {
      return jsonBody;
    }
  }
}
