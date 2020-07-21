import 'package:json_annotation/json_annotation.dart';

part 'product_model.g.dart';

@JsonSerializable()
class Product {
  double value;
  String name;
  bool available;
  String photoUrl;
  String fileName;
  
  Product({
    this.value,
    this.name,
    this.available = false,
    this.photoUrl,
    this.fileName
  });

  factory Product.fromJson(Map<String, dynamic> json)  => _$ProductFromJson(json);

  Map<String, dynamic> toJson() => _$ProductToJson(this);
}
