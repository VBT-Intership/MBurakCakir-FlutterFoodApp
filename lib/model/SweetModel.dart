class SweetModel {
  String colorCode;
  String category;
  int countItem;
  String url;

  SweetModel(this.colorCode, this.category, this.countItem, this.url);

  SweetModel.fromJson(Map<String, dynamic> json) {
    colorCode = json['background_color'];
    category = json['category'];
    countItem = json['count_item'];
    url = json['url'];
  }
}
