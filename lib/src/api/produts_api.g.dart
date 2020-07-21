// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'produts_api.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _ProductsApi implements ProductsApi {
  _ProductsApi(this._dio, {this.baseUrl}) {
    ArgumentError.checkNotNull(_dio, '_dio');
    this.baseUrl ??= 'https://flutterproduts.firebaseio.com';
  }

  final Dio _dio;

  String baseUrl;

  @override
  getProducts(auth) async {
    ArgumentError.checkNotNull(auth, 'auth');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'auth': auth};
    final _data = <String, dynamic>{};
    final Response _result = await _dio.request('/productos.json',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = _result.data;
    final httpResponse = HttpResponse(value, _result);
    return httpResponse;
  }

  @override
  createProduct(product, auth) async {
    ArgumentError.checkNotNull(product, 'product');
    ArgumentError.checkNotNull(auth, 'auth');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'auth': auth};
    final _data = <String, dynamic>{};
    _data.addAll(product?.toJson() ?? <String, dynamic>{});
    final Response<String> _result = await _dio.request('/productos.json',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = _result.data;
    return value;
  }

  @override
  deleteProduct(id, auth) async {
    ArgumentError.checkNotNull(id, 'id');
    ArgumentError.checkNotNull(auth, 'auth');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'auth': auth};
    final _data = <String, dynamic>{};
    await _dio.request<void>('/productos/$id.json',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'DELETE',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    return null;
  }

  @override
  editProduct(id, product, auth) async {
    ArgumentError.checkNotNull(id, 'id');
    ArgumentError.checkNotNull(product, 'product');
    ArgumentError.checkNotNull(auth, 'auth');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'auth': auth};
    final _data = <String, dynamic>{};
    _data.addAll(product?.toJson() ?? <String, dynamic>{});
    final Response<Map<String, dynamic>> _result = await _dio.request(
        '/productos/$id.json',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'PUT',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = Product.fromJson(_result.data);
    return value;
  }
}
