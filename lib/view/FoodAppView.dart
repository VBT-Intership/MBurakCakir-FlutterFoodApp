import 'package:flutter/material.dart';
import 'package:flutter_food_app/widgets/BuildApp.dart';

import '../viewmodel/FoodViewModel.dart';

class FoodAppView extends FoodViewModel {
  @override
  Widget build(BuildContext context) {
    return BuildApp(sweetModelList, foodModelList);
  }

// Card buildCardHttp(FoodModel cat) {
//   return Card(
//     margin: EdgeInsets.all(20),
//     child: ListTile(
//       title: SizedBox(height: MediaQuery.of(context).size.height * 0.2, child: Image.network(cat.url)),
//       subtitle: Text(cat.url),
//       trailing: Text(cat.url.toString()),
//     ),
//   );
// }
//
// AppBar buildAppBar(BuildContext context) {
//   return AppBar(
//     title: buildTextAppBar(),
//     leading: buildPaddingProgress,
//   );
// }
//
// Widget get buildPaddingProgress {
//   return Visibility(
//     visible: isLoading,
//     child: Padding(
//       padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.03),
//       child: CircularProgressIndicator(
//         valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
//       ),
//     ),
//   );
// }
//
// Text buildTextAppBar() => Text("Http Cat View");
}
