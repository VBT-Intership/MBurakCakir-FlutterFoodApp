import 'package:flutter_food_app/model/FoodModel.dart';
import 'package:flutter_food_app/model/SweetModel.dart';
import 'package:flutter_food_app/model/TaskModel.dart';

abstract class IAppService {
  Future<List<FoodModel>> getFoodList();

  Future<List<SweetModel>> getSweetList();

  Future<List<TaskModel>> getTaskList();
}
