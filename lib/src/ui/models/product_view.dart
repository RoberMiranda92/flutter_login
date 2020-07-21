import 'package:equatable/equatable.dart';

class ProductView extends Equatable {
  String id;
  double value;
  String name;
  bool available = false;
  String photoUrl;
  String fileName;

  ProductView.empty();

  ProductView(this.id, this.value, this.name, this.available, this.photoUrl,
      this.fileName);

  bool hasID() => id?.isNotEmpty == true;

  @override
  List<Object> get props => [id];
}
