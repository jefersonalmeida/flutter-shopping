import 'package:shopping/models/category.model.dart';

class ProductDetailsModel {
  String id;
  String title;
  double description;
  String brand;
  String tag;
  double price;
  List<String> images;
  CategoryModel category;

  ProductDetailsModel(
      {this.id,
      this.title,
      this.description,
      this.brand,
      this.tag,
      this.price,
      this.images,
      this.category});

  ProductDetailsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    brand = json['brand'];
    tag = json['tag'];
    price = json['price'];
    images = json['images'].cast<String>();
    category = json['category'] != null
        ? new CategoryModel.fromJson(json['category'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['description'] = this.description;
    data['brand'] = this.brand;
    data['tag'] = this.tag;
    data['price'] = this.price;
    data['images'] = this.images;
    if (this.category != null) {
      data['category'] = this.category.toJson();
    }
    return data;
  }
}
