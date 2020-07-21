import 'package:meta/meta.dart';

abstract class CreateProductDetailState {
  const CreateProductDetailState();
}

class CreateProductDetailInitialState extends CreateProductDetailState {
  const CreateProductDetailInitialState();

  @override
  String toString() {
    return 'CreateProductDetailInitialState';
  }
}

class CreateProductDetailLoadingState extends CreateProductDetailState {
  const CreateProductDetailLoadingState();

  @override
  String toString() {
    return 'CreateProductDetailLoadingState';
  }
}

class CreateProductDetailSuccessState extends CreateProductDetailState {
  const CreateProductDetailSuccessState();

  @override
  String toString() {
    return 'CreateProductDetailSuccessState';
  }
}

class CreateProductDetailErrorState extends CreateProductDetailState {
  final String error;
  const CreateProductDetailErrorState({@required this.error});

  @override
  String toString() {
    return 'CreateProductDetailSuccesState {error: $error}';
  }
}
