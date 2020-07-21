import 'package:flutter_login/src/ui/models/product_view.dart';
import 'package:meta/meta.dart';

abstract class ProductListEvent {
  const ProductListEvent();
}

class ProductListLoadList extends ProductListEvent {
  const ProductListLoadList();
}

class ProductDeleteElement extends ProductListEvent {
  final ProductView product;
  final List<ProductView> products;

  const ProductDeleteElement({@required this.product, @required this.products});
}
