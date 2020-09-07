import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_food_app/model/ErrorModel.dart';
import 'package:flutter_food_app/model/FoodModel.dart';
import 'package:flutter_food_app/model/SweetModel.dart';
import 'package:flutter_food_app/viewmodel/FoodViewModel.dart';
import 'package:flutter_food_app/widgets/BuildFoodListView.dart';
import 'package:flutter_food_app/widgets/BuildHeader.dart';
import 'package:flutter_food_app/widgets/BuildRowPopular.dart';
import 'package:flutter_food_app/widgets/BuildSweetListView.dart';

double margin;

class FoodAppView extends FoodViewModel {
  @override
  Widget build(BuildContext context) {
    margin = MediaQuery.of(context).size.width * 0.02;
    return Scaffold(appBar: buildAppBar(context), body: buildBodyContainer());
  }

  Container buildBodyContainer() {
    return Container(
      padding: EdgeInsets.all(margin),
      child: Column(
        children: [
          Expanded(flex: 1, child: BuildHeader()),
          Expanded(
              flex: 2,
              child: buildFoodFutureBuilder<SweetModel>(listSweetModel)),
          Expanded(flex: 1, child: BuildRowPopular()),
          Expanded(
              flex: 3, child: buildFoodFutureBuilder<FoodModel>(listFoodModel)),
        ],
      ),
    );
  }

  FutureBuilder buildFoodFutureBuilder<BaseModel>(Future future) {
    return FutureBuilder<List<BaseModel>>(
      future: future,
      builder: (BuildContext context, AsyncSnapshot<List<BaseModel>> snapshot) {
        return checkConnectionState(snapshot);
      },
    );
  }

  checkConnectionState(snapshot) {
    switch (snapshot.connectionState) {
      case ConnectionState.active:
      case ConnectionState.waiting:
        return Center(child: CircularProgressIndicator());
      case ConnectionState.done:
        if (snapshot.hasData) {
          if (snapshot is AsyncSnapshot<List<FoodModel>>)
            return BuildFoodListView(snapshot.data);
          else
            return BuildSweetListView(snapshot.data);
        } else {
          final error = snapshot.error as ErrorModel;
          return Center(
            child: Text(error.text),
          );
        }
        break;
      default:
        return Text("Something went wrong");
    }
  }

  AppBar buildAppBar(BuildContext context) =>
      isLoading ? buildTextAppBar() : buildIconAppBar();

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

  Widget get buildPaddingProgress {
    return Visibility(
      visible: isLoading,
      child: Padding(
        padding: EdgeInsets.all(MediaQuery
            .of(context)
            .size
            .width * 0.03),
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
        ),
      ),
    );
  }
}
