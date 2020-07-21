import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_login/generated/l10n.dart';
import 'package:flutter_login/src/product_detail.dart/bloc/create_product_bloc.dart';
import 'package:flutter_login/src/product_detail.dart/bloc/models/create_product_state.dart';
import 'package:flutter_login/src/product_detail.dart/bloc/models/product_detail_event.dart';
import 'package:flutter_login/src/product_detail.dart/ui/product_form.dart';
import 'package:flutter_login/src/ui/models/product_view.dart';
import 'package:flutter_login/src/ui/utils/ui_utils.dart';
import 'package:flutter_login/src/widgets/error_widget.dart';

class CreateProductPage extends StatefulWidget {
  static const String PRODUCT_ARG = "product_arg";

  CreateProductPage({Key key}) : super(key: key);

  @override
  _CreateproductPageState createState() => _CreateproductPageState();
}

class _CreateproductPageState extends State<CreateProductPage> {
  final _formKey = GlobalKey<ProductFormState>();
  final _scaffolKey = GlobalKey<ScaffoldState>();

  ProductView _product;
  File _file;
  BuildContext _createProductBlocContext;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> args =
        ModalRoute.of(context).settings.arguments as Map<String, dynamic>;

    final ProductView prodModel = initFromArg(args);
    if (_product == null) {
      _product = prodModel;
    }

    return Scaffold(
      key: _scaffolKey,
      appBar: AppBar(
          title: Text(S.of(context).product_detail_title),
          actions: <Widget>[_saveButton(context)],
          leading: new IconButton(
            icon: new Icon(
                Platform.isAndroid ? Icons.arrow_back : Icons.arrow_back_ios),
            onPressed: () {
              Navigator.pop(context, true);
            },
          )),
      body: GestureDetector(
        onTap: () {
          FocusManager.instance.primaryFocus.unfocus();
          FocusScope.of(context).unfocus();
        },
        child: BlocProvider<CreateProductBloc>(
          create: (BuildContext context) {
            return CreateProductBloc();
          },
          child: BlocListener<CreateProductBloc, CreateProductDetailState>(
            listener: (BuildContext context, CreateProductDetailState state) {
              if (state is CreateProductDetailSuccessState) {
                onProductAdded(context);
              }
            },
            child: BlocBuilder<CreateProductBloc, CreateProductDetailState>(
              builder: (BuildContext context, CreateProductDetailState state) {
                _createProductBlocContext = context;
                Widget child;

                if (state is CreateProductDetailLoadingState) {
                  child = Center(child: CircularProgressIndicator());
                }

                if (state is CreateProductDetailInitialState ||
                    state is CreateProductDetailSuccessState) {
                  child = _createFormContainer();
                }

                if (state is CreateProductDetailErrorState) {
                  child = ErrorView(errorMessage: state.error, onTap: null);
                }

                return child;
              },
            ),
          ),
        ),
      ),
    );
  }

  Widget _createFormContainer() {
    return SingleChildScrollView(
        child: Container(
            padding: EdgeInsets.all(20),
            child: ProductForm(key: _formKey, product: _product, file: _file,)));
  }

  Widget _saveButton(BuildContext context) {
    return IconButton(
        icon: Icon(Icons.save),
        onPressed: () {
          ProductFormState state = _formKey.currentState;

          if (state.validate()) {
            state.save();
            _product = state.product;
            _file = state.file;
            _product.hasID() ? editProduct() : createproduct();
          }
        });
  }

  ProductView initFromArg(Map<String, dynamic> args) {
    if (args != null && args.containsKey(CreateProductPage.PRODUCT_ARG)) {
      return args[CreateProductPage.PRODUCT_ARG];
    } else {
      return ProductView.empty();
    }
  }

  void editProduct() {
    BlocProvider.of<CreateProductBloc>(_createProductBlocContext)
        .add(ProductDetailEditProduct(product: _product));
  }

  void createproduct() {
    BlocProvider.of<CreateProductBloc>(_createProductBlocContext)
        .add(ProductDetailCreateProduct(product: _product, file: _file));
  }

  void onProductAdded(context) {
    showSnackBarOK(
        _scaffolKey.currentState, S.of(context).product_detail_added);
  }
}
