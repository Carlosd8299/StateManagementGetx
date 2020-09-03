import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:get/state_manager.dart';
import 'package:getxdemo/models/products.dart';

class GlobalController extends GetxController {
  List<Product> _products = [];
  Map<String, Product> _favorites = Map();
  Map<String, Product> get getFavorites => _favorites;

  List<Product> get getProducts => _products;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

    _loadProducts();
  }

  Future<void> _loadProducts() async {
    final String productString =
        await rootBundle.loadString('assets/products.json');
    this._products = (jsonDecode(productString) as List)
        .map((e) => Product.fromJson(e))
        .toList();
    print("Productos cargados init");
    update(['products']);
  }

  onFavorited(int index, bool isFavorite) {
    Product product = this.getProducts[index];
    product.isfavorited = isFavorite;
    if (isFavorite) {
      this._favorites[product.nombre] = product;
    } else {
      this._favorites.remove(product.nombre);
    }
    update(['products', 'favorites']);
  }
}
