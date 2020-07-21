import 'package:flutter/material.dart';
import 'package:flutter_login/src/login/ui/login_page.dart';
import 'package:flutter_login/src/product_detail.dart/ui/create_product_page.dart';
import 'package:flutter_login/src/product_list/ui/product_list_page.dart';
import 'package:flutter_login/src/register/ui/register_page.dart';

class Routes {
  // Route name constants
  static const String LOGIN = '/login';
  static const String REGISTER = '/register';
  static const String PRODUCT_LIST = "/home";
  static const String CREATE_PRODUCT = "/create";

  static Map<String, WidgetBuilder> getRoutes() {
    return {
      LOGIN: (context) => LoginPage(),
      REGISTER: (context) => RegisterPage(),
      PRODUCT_LIST: (context) => ProductListPage(),
      CREATE_PRODUCT: (context) => CreateProductPage()
    };
  }
}
