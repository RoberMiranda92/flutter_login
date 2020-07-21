// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Product _$ProductFromJson(Map<String, dynamic> json) {
  return Product(
    value: (json['value'] as num)?.toDouble(),
    name: json['name'] as String,
    available: json['available'] as bool,
    photoUrl: json['photoUrl'] as String,
    fileName: json['fileName'] as String,
  );
}

Map<String, dynamic> _$ProductToJson(Product instance) => <String, dynamic>{
      'value': instance.value,
      'name': instance.name,
      'available': instance.available,
      'photoUrl': instance.photoUrl,
      'fileName': instance.fileName,
    };
