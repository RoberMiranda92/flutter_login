import 'dart:io';

import 'package:flutter_login/src/ui/models/product_view.dart';
import 'package:meta/meta.dart';

abstract class CreateProductDetailEvent {
  final ProductView product;
  final File file;

  const CreateProductDetailEvent({@required this.product, this.file});
}

class ProductDetailCreateProduct extends CreateProductDetailEvent {
  const ProductDetailCreateProduct({@required product, File file})
      : super(product: product, file: file);

  @override
  String toString() {
    return 'ProductDetailCreateProduct { product: $product, file: $file }';
  }
}

class ProductDetailEditProduct extends CreateProductDetailEvent {
  const ProductDetailEditProduct({@required product, File file})
      : super(product: product, file: file);

  @override
  String toString() {
    return 'ProductDetailEditProduct { product: $product, file: $file }';
  }
}
