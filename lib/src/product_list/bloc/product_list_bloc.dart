import 'package:flutter_login/src/bloc/base_bloc.dart';
import 'package:flutter_login/src/product_list/bloc/product_list_event.dart';
import 'package:flutter_login/src/product_list/bloc/product_list_state.dart';
import 'package:flutter_login/src/provider/product_provider.dart';
import 'package:flutter_login/src/provider/sesion_provider.dart';
import 'package:flutter_login/src/ui/models/product_view.dart';

class ProductListBloc extends BaseBloc<ProductListEvent, ProductListState> {
  static const int PRODUCT_LIST_BLOC_TYPE = 2;
  final ProductProvider productPovider;
  final SessionProvider sessionProvider = SessionProvider.instance;

  ProductListBloc({this.productPovider}) : super(ProductListLoading());

  @override
  int getType() => PRODUCT_LIST_BLOC_TYPE;

  @override
  Stream<ProductListState> mapEventToState(ProductListEvent event) async* {
    if (event is ProductListLoadList) {
      yield ProductListLoading();
      try {
        List<ProductView> list = await productPovider
            .getProducts(sessionProvider.token)
            .then((result) {
          List<ProductView> list = List<ProductView>();
          result?.forEach((id, product) {
            list.add(ProductView(id, product.value, product.name,
                product.available, product.photoUrl, product.fileName));
          });

          return list;
        });
        yield list.isEmpty
            ? ProductListEmpty()
            : ProductListLoaded(products: list);
      } catch (error, stacktrace) {
        yield ProductListError(error: error.toString());
      }
    }

    if (event is ProductDeleteElement) {
      try {
        ProductView p = event.product;
        List<ProductView> list = event.products;
        await productPovider.deleteProduct(p.id, sessionProvider.token);
        list.remove(p);

        yield list.isEmpty
            ? ProductListEmpty()
            : ProductDeleteSuccess(products: list, deletedProduct: p);
      } catch (error, stacktrace) {
        yield ProductListError(error: error.toString());
      }
    }
  }
}
