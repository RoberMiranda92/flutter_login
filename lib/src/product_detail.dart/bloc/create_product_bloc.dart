import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_login/src/api/product_model.dart';
import 'package:flutter_login/src/api/storage.dart';
import 'package:flutter_login/src/bloc/base_bloc.dart';
import 'package:flutter_login/src/product_detail.dart/bloc/models/create_product_state.dart';
import 'package:flutter_login/src/product_detail.dart/bloc/models/product_detail_event.dart';
import 'package:flutter_login/src/provider/file_provider.dart';
import 'package:flutter_login/src/provider/product_provider.dart';
import 'package:flutter_login/src/provider/sesion_provider.dart';

class CreateProductBloc
    extends BaseBloc<CreateProductDetailEvent, CreateProductDetailState> {
  final ProductProvider _provider = ProductProvider.instance;
  final SessionProvider _sessionProvider = SessionProvider.instance;
  final FileProvider _fileProvider = FileProvider.instance;

  CreateProductBloc() : super(CreateProductDetailInitialState());

  @override
  int getType() => 999;

  @override
  Stream<CreateProductDetailState> mapEventToState(
      CreateProductDetailEvent event) async* {
    if (event is ProductDetailCreateProduct ||
        state is ProductDetailEditProduct) {
      try {
        yield CreateProductDetailLoadingState();
        var pView = event.product;
        var pFile = event.file;
        var product = Product(
            value: pView.value,
            available: pView.available,
            fileName: pView.fileName,
            name: pView.name,
            photoUrl: pView.photoUrl);

        if (pFile != null) {
          UploadFileResult result = await _fileProvider.uploadFile(pFile);
          product.photoUrl = result.url;
          product.name = result.name;
        }

        if (state is ProductDetailCreateProduct) {
          await _provider.createProduct(product, _sessionProvider.token);
        } else {
          await _provider.editProduct(
              pView.id, product, _sessionProvider.token);
        }
        yield CreateProductDetailSuccessState();
      } catch (error, stacktrace) {
        yield CreateProductDetailErrorState(error: error.toString());
      }
    }
  }
}
