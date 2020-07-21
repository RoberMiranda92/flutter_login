import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_login/generated/l10n.dart';
import 'package:flutter_login/src/product_list/bloc/product_list_bloc.dart';
import 'package:flutter_login/src/product_list/bloc/product_list_event.dart';
import 'package:flutter_login/src/product_list/bloc/product_list_state.dart';
import 'package:flutter_login/src/ui/models/product_view.dart';
import 'package:flutter_login/src/ui/utils/ui_utils.dart';
import 'package:flutter_login/src/widgets/error_widget.dart';

class ProductList extends StatefulWidget {
  final Function(ProductView productView, BuildContext context) onTap;

  ProductList({Key key, @required this.onTap}) : super(key: key);

  @override
  _ProductListState createState() => _ProductListState(onTap);
}

class _ProductListState extends State<ProductList> {
  final Function(ProductView productView, BuildContext context) onTap;

  _ProductListState(this.onTap);

  @override
  void initState() {
    _loadProductList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ProductListBloc, ProductListState>(
      listener: (BuildContext context, state) {
        if (state is ProductDeleteSuccess) {
          final p = state.deletedProduct;
          showSnackBarOK(Scaffold.of(context),
              S.of(context).product_delete_message(p.name));
        }
      },
      child: BlocBuilder<ProductListBloc, ProductListState>(
        builder: (BuildContext context, ProductListState state) {
          Widget widget;
          if (state is ProductListLoading) {
            widget = Center(child: CircularProgressIndicator());
          }

          if (state is ProductListError) {
            widget = Center(
                child: ErrorView(
                    errorMessage: state.error, onTap: _loadProductList));
          }

          if (state is ProductListEmpty) {
            widget = Center(child: Text(S.of(context).product_list_no_content));
          }

          if (state is ProductListSuccess) {
            var data = state.products;
            widget = ListView.separated(
                itemCount: data.length,
                separatorBuilder: (BuildContext context, int index) {
                  return Divider(key: UniqueKey());
                },
                itemBuilder: (BuildContext context, int index) {
                  var item = data[index];
                  return Dismissible(
                      key: UniqueKey(),
                      background: Container(
                        padding: EdgeInsets.all(20),
                        color: Colors.red,
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            S.of(context).home_delete,
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                      child: ListTile(
                        title: Text("${item.name} - ${item.value}"),
                        subtitle: Text(item.id),
                        onTap: () => onTap(item, context),
                      ),
                      onDismissed: (direction) {
                        BlocProvider.of<ProductListBloc>(context).add(
                            ProductDeleteElement(
                                product: item, products: data));
                      });
                });
          }
          return widget;
        },
      ),
    );
  }

  void _loadProductList() {
    BlocProvider.of<ProductListBloc>(context).add(ProductListLoadList());
  }
}
