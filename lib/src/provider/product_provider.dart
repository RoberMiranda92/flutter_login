import 'package:flutter_login/src/api/product_model.dart';
import 'package:flutter_login/src/api/produts_api.dart';
import 'package:dio/dio.dart';

class ProductProvider {
  static final ProductProvider _instance =
      ProductProvider._(ProductsApi(Dio()));

  ProductsApi _api;
  ProductProvider._(this._api);

  static ProductProvider get instance => _instance;

  Future<String> createProduct(Product product, String authToken) {
    return _api.createProduct(product, authToken);
  }

  Future<Map<String, Product>> getProducts(String authToken) {
    return _api.getProducts(authToken).then((value) {
      return value.data == null
          ? Map<String, Product>()
          : (value.data as Map).map<String, Product>((k, dynamic v) =>
              MapEntry(k, Product.fromJson(v as Map<String, dynamic>)));
    });
  }

  Future<void> deleteProduct(String id, String authToken) {
    return _api.deleteProduct(id, authToken);
  }

  Future<Product> editProduct(String id, Product product, String authToken) {
    return _api.editProduct(id, product, authToken);
  }
}
