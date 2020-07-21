import 'package:flutter_login/src/api/product_model.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'produts_api.g.dart';

@RestApi(baseUrl: "https://flutterproduts.firebaseio.com")
abstract class ProductsApi {
  factory ProductsApi(Dio dio, {String baseUrl}) = _ProductsApi;

  @GET("/productos.json")
  Future<HttpResponse> getProducts(
      @Query("auth") String auth);

  @POST("/productos.json")
  Future<String> createProduct(
      @Body() Product product, @Query("auth") String auth);

  @DELETE("/productos/{id}.json")
  Future<void> deleteProduct(@Path("id") String id, @Query("auth") String auth);

  @PUT("/productos/{id}.json")
  Future<Product> editProduct(@Path("id") String id, @Body() Product product,
      @Query("auth") String auth);
}
