import 'package:flutter/widgets.dart';
import 'package:shopping/models/category.model.dart';
import 'package:shopping/models/product-list-item.model.dart';
import 'package:shopping/repositories/category.repository.dart';
import 'package:shopping/repositories/product.repository.dart';

class HomeBloc extends ChangeNotifier {
  final categoryRepository = new CategoryRepository();
  final productRepository = new ProductRepository();

  List<ProductListItemModel> products;
  List<CategoryModel> categories;
  String selectedCategory = 'todos';

  HomeBloc() {
    this.getCategories();
    this.getProducts();
  }

  getCategories() {
    categoryRepository.getAll().then((data) {
      this.categories = data;
      notifyListeners();
    });
  }

  getProducts() {
    productRepository.getAll().then((data) {
      this.products = data;
      notifyListeners();
    });
  }

  getProductsByCategory() {
    productRepository.getByCategory(selectedCategory).then((data) {
      this.products = data;
      notifyListeners();
    });
  }

  changeCategory(String tag) {
    selectedCategory = tag;
    this.products = null;
    getProductsByCategory();
    notifyListeners();
  }
}
