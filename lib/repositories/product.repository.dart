import 'package:dio/dio.dart';
import 'package:shopping/models/product-list-item.model.dart';
import 'package:shopping/settings.dart';

class ProductRepository {
  Future<List<ProductListItemModel>> getAll() async {
    var url = '${Settings.apiUrl}/v1/products';
    Response response = await Dio().get(url);
    return (response.data as List)
        .map((p) => ProductListItemModel.fromJson(p))
        .toList();
  }

  Future<List<ProductListItemModel>> getByCategory(String category) async {
    var url = '${Settings.apiUrl}/v1/categories/$category/products';
    Response response = await Dio().get(url);
    return (response.data as List)
        .map((p) => ProductListItemModel.fromJson(p))
        .toList();
  }

  Future<ProductListItemModel> get(String tag) async {
    var url = '${Settings.apiUrl}/v1/products/$tag';
    Response response = await Dio().get(url);
    return ProductListItemModel.fromJson(response.data);
  }
}
