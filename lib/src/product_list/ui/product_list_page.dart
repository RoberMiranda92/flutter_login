import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_login/generated/l10n.dart';
import 'package:flutter_login/src/product_detail.dart/ui/create_product_page.dart';
import 'package:flutter_login/src/product_list/bloc/product_list_bloc.dart';
import 'package:flutter_login/src/product_list/ui/product_list.dart';
import 'package:flutter_login/src/provider/product_provider.dart';
import 'package:flutter_login/src/ui/models/product_view.dart';
import 'package:flutter_login/src/ui/routes.dart';

class ProductListPage extends StatefulWidget {
  @override
  _ProductListPageState createState() => _ProductListPageState();
}

class _ProductListPageState extends State<ProductListPage> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        appBar:
            AppBar(title: Text(S.of(context).home_title), centerTitle: true),
        body: Center(
          child: BlocProvider<ProductListBloc>(
              lazy: false,
              create: (BuildContext context) {
                return ProductListBloc(
                    productPovider: ProductProvider.instance);
              },
              child: Center(
                  child: ProductList(
                      onTap: (productView, ontext) =>
                          goToDetail(productView, context)))),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            goToDetail(null, context);
          },
          icon: Icon(Icons.add),
          label: Text(S.of(context).home_add_product),
        ),
      ),
    );
  }

  void goToDetail(ProductView item, BuildContext context) async {
    Map<String, dynamic> args = Map<String, dynamic>();
    if (item != null) {
      args[CreateProductPage.PRODUCT_ARG] = item;
    }
    Navigator.pushNamed(context, Routes.CREATE_PRODUCT, arguments: args);
  }
}

// Stack(children: <Widget>[
//           Container(height: 80, width: double.infinity, color: Colors.red),
//           Positioned(
//               height: 80,
//               width: 80,
//               top: 0,
//               left: _distanceX,
//               child: GestureDetector(
//                 dragStartBehavior: DragStartBehavior.start,
//                 onHorizontalDragDown: (detail) {},
//                 onHorizontalDragStart: (details) {},
//                 onHorizontalDragCancel: () {},
//                 onHorizontalDragUpdate: (details) {
//                   var currentX = details.localPosition.dx;
//                   setState(() {
//                     _distanceX = currentX <= _size.width - 80
//                         ? currentX
//                         : _size.width - 80;
//                   });
//                 },
//                 onHorizontalDragEnd: (details) {
//                   setState(() {
//                     _distanceX = 0;
//                   });
//                 },
//                 child: Container(
//                   height: 80,
//                   width: 80,
//                   decoration: BoxDecoration(
//                       color: Colors.white,
//                       borderRadius: BorderRadius.circular(360)),
//                 ),
//               )),
//         ])
