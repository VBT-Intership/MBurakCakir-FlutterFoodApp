import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Material App',
        home: Scaffold(
          appBar: AppBar(
              backgroundColor: Colors.white, actions: [buildRowAppBar()]),
          body: Container(
            padding: EdgeInsets.all(10),
            child: Column(
              children: [
                Expanded(flex: 1, child: (buildRowHeader())),
                Expanded(flex: 2, child: (buildRowCategoryList())),
                Expanded(flex: 1, child: (buildColumnPopular())),
                Expanded(flex: 3, child: buildListViewCategoryList())
              ],
            ),
          ),
        ));
  }

  ListView buildListViewCategoryList() {
    List imageList = manipulateImageList();
    List colorList = manipulateColorList();
    List titleList = manipulateTitleList();
    List rpList = manipulateRpList();
    return ListView(
      scrollDirection: Axis.vertical,
      children: [
        for (var index = 0; index < imageList.length; index++)
          buildCardListView(imageList[index], colorList[index],
              titleList[index], rpList[index]),
      ],
    );
  }

  Card buildCardListView(imageList, colorList, manipulateTitleList, rpList) {
    return Card(
        margin: EdgeInsets.fromLTRB(10, 0, 10, 10),
        child: Row(
          children: [
            buildCardImage(imageList, colorList),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                buildTextTitle(manipulateTitleList),
                buildRowTags(),
                buildSizedBoxSubtitle(rpList)
              ],
            )
          ],
        ));
  }

  Text buildTextTitle(text) {
    return Text(text,
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold));
  }

  Row buildRowTags() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
            child: buildCardFeature(
                "Gorengan", Color(0xFFFAF2DA), Colors.orangeAccent)),
        Container(
            child: buildCardFeature(
                "Makanan Ringan", Color(0xFFEFF6FE), Colors.blue))
      ],
    );
  }

  SizedBox buildSizedBoxSubtitle(rpList) {
    return SizedBox(
        width: 250,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
                margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                child: Text(
                  "Warung buyayuk",
                  style: TextStyle(color: Colors.grey[400]),
                )),
            Container(
              margin: EdgeInsets.fromLTRB(0, 0, 10, 0),
              child: Text(
                rpList,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            )
          ],
        ));
  }

  Card buildCardFeature(text, Color colorBackground, Color colorText) {
    return Card(
        color: colorBackground,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        child: (Padding(
          padding: EdgeInsets.all(5),
          child: Text(text, style: TextStyle(color: colorText)),
        )));
  }

  Card buildCardImage(list, color) {
    return Card(
        color: color,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        elevation: 5,
        margin: EdgeInsets.all(10),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Padding(
            padding: EdgeInsets.all(8),
            child: Image.network(
              list,
              height: 60,
              width: 60,
            )));
  }

  Container buildColumnPopular() {
    return Container(
        alignment: Alignment.center,
        child: ListTile(
            title: Text("Popular",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
            subtitle: Text("Moniggo, falan filan",
                style: TextStyle(color: CupertinoColors.inactiveGray)),
            leading: buildCardIcon(Icons.favorite, Colors.red, Colors.white),
            trailing: Icon(Icons.arrow_forward, color: Colors.black)));
  }

  Card buildCardIcon(icon, color, iconColor) {
    return Card(
        color: color,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        elevation: 5,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Padding(
            padding: EdgeInsets.all(12), child: Icon(icon, color: iconColor)));
  }

  Container buildRowCategoryList() {
    List imageList = manipulateImageList();
    List colorList = manipulateColorList();
    return Container(
        margin: EdgeInsets.fromLTRB(10, 0, 0, 0),
        color: Colors.white,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: <Widget>[
            buildContainer(imageList[0], colorList[0]),
            buildContainer(imageList[1], colorList[1]),
            buildContainer(imageList[2], colorList[2])
          ],
        ));
  }

  Column buildContainer(imageList, colorList) {
    return Column(
      children: [
        buildClipRRect(imageList, colorList),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Sweets  ",
                style: TextStyle(
                    color: CupertinoColors.inactiveGray,
                    fontWeight: FontWeight.bold)),
            Text("12 item", style: TextStyle(fontWeight: FontWeight.bold))
          ],
        )
      ],
    );
  }

  Card buildClipRRect(imageList, colorList) {
    return Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        margin: EdgeInsets.fromLTRB(7, 7, 7, 7),
        color: colorList,
        child: Container(
            padding: EdgeInsets.all(5),
            child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.network(
                  imageList,
                  height: 125,
                  width: 125,
                ))));
  }

  Expanded buildRowAppBar() {
    return Expanded(
        child: Row(
      children: [
        IconButton(
            icon: Icon(Icons.arrow_back_ios),
            color: Colors.black,
            onPressed: () {}),
        Spacer(),
        IconButton(
            icon: Icon(Icons.subject), color: Colors.black, onPressed: () {})
      ],
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
    ));
  }

  Container buildRowHeader() {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
      child: Row(
        children: [
          Text("What do you want\nto eat today?",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
          buildCardIcon(Icons.search, Colors.white, Colors.black)
        ],
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
      ),
    );
  }
}

List manipulateImageList() {
  List list = new List();
  list.add("http://pngimg.com/uploads/donut/donut_PNG96.png");
  list.add("http://pngimg.com/uploads/ice_cream/ice_cream_PNG20995.png");
  list.add("http://pngimg.com/uploads/pancake/pancake_PNG122.png");
  return list;
}

List manipulateTitleList() {
  List list = new List();
  list.add("Banana Goreng");
  list.add("Donat Cilik");
  list.add("Copy Anget");
  return list;
}

List manipulateRpList() {
  List list = new List();
  list.add("Rp. 2.500");
  list.add("Rp. 12.000");
  list.add("Rp. 4.500");
  return list;
}

List manipulateColorList() {
  List list = new List();
  list.add(Colors.blueAccent);
  list.add(Colors.yellowAccent);
  list.add(Colors.green);
  return list;
}
