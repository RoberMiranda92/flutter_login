import 'package:equatable/equatable.dart';
import 'package:flutter_login/src/ui/models/product_view.dart';
import 'package:meta/meta.dart';

abstract class ProductListState extends Equatable {
  const ProductListState();
}

class ProductListEmpty extends ProductListState {
  const ProductListEmpty();

  @override
  List<Object> get props => [];

  @override
  String toString() {
    return 'ProductListEmpty';
  }
}

class ProductListSuccess extends ProductListState {
  final List<ProductView> products;

  const ProductListSuccess({@required this.products});

  @override
  List<Object> get props => [products];

  @override
  String toString() {
    return 'ProductListSuccess { products: $products }';
  }
}

class ProductListLoaded extends ProductListSuccess {
  const ProductListLoaded({@required products}) : super(products: products);

  @override
  String toString() {
    return 'ProductListLoaded { products: $products }';
  }
}

class ProductDeleteSuccess extends ProductListSuccess {
  final ProductView deletedProduct;

  const ProductDeleteSuccess(
      {@required this.deletedProduct, @required products})
      : super(products: products);

  @override
  List<Object> get props => [deletedProduct, products];

  @override
  String toString() {
    return 'ProductDeleteSuccess { deletedProduct $deletedProduct products: $products }';
  }
}

class ProductListLoading extends ProductListState {
  @override
  List<Object> get props => [];

  @override
  String toString() {
    return 'ProductListLoading';
  }
}

class ProductListError extends ProductListState {
  final String error;

  const ProductListError({@required this.error});

  @override
  List<Object> get props => [error];

  @override
  String toString() {
    return 'ProductListError { error: $error }';
  }
}
