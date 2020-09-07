import 'BaseModel.dart';

class FoodModel extends BaseModel<FoodModel> {
  String title;
  String name;
  String hashtag1;
  String hashtag2;
  String owner;
  String rp;
  String backgroundColor;
  String url;

  FoodModel(
      {this.title,
      this.name,
      this.hashtag1,
      this.hashtag2,
      this.owner,
      this.rp,
      this.backgroundColor,
      this.url});

  FoodModel.fromJson(Map<String, dynamic> json) {
    title = json['category'];
    name = json['name'];
    hashtag1 = json['hashtag1'];
    hashtag2 = json['hashtag2'];
    owner = json['owner'];
    rp = json['rp'];
    backgroundColor = json['background_color'];
    url = json['url'];
  }

  @override
  FoodModel fromJson(Map<String, Object> json) {
    return FoodModel.fromJson(json);
  }

  @override
  Map<String, Object> toJson() {
    // TODO: implement toJson
    throw UnimplementedError();
  }
}
