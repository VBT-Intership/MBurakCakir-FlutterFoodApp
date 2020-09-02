import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_food_app/viewmodel/FoodViewModel.dart';
import 'package:flutter_food_app/widgets/BuildFoodListView.dart';
import 'package:flutter_food_app/widgets/BuildHeader.dart';
import 'package:flutter_food_app/widgets/BuildRowPopular.dart';
import 'package:flutter_food_app/widgets/BuildSweetListView.dart';

class FoodAppView extends FoodViewModel {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: buildAppBar(context),
        body: Container(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              Expanded(flex: 1, child: BuildHeader()),
              Expanded(flex: 2, child: BuildSweetListView(sweetModelList)),
              Expanded(flex: 1, child: BuildRowPopular()),
              Expanded(flex: 3, child: BuildFoodListView(foodModelList))
            ],
          ),
        ));
  }

  AppBar buildAppBar(BuildContext context) =>
      isLoading ? buildTextAppBar() : buildIconAppBar();

  Widget get buildPaddingProgress {
    return Visibility(
      visible: isLoading,
      child: Padding(
        padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.03),
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
        ),
      ),
    );
  }

  AppBar buildTextAppBar() {
    return AppBar(
      title: Text("Loading..."),
      leading: buildPaddingProgress,
    );
  }

  AppBar buildIconAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      actions: [
        Expanded(
            child: Row(
          children: [
            IconButton(
                icon: Icon(Icons.arrow_back_ios),
                color: Colors.black,
                onPressed: () {}),
            Spacer(),
            IconButton(
                icon: Icon(Icons.subject),
                color: Colors.black,
                onPressed: () {})
          ],
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
        ))
      ],
    );
  }
}
