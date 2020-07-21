import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_login/generated/l10n.dart';
import 'package:flutter_login/src/ui/models/product_view.dart';
import 'package:flutter_login/src/ui/utils/ui_utils.dart';
import 'package:flutter_login/src/widgets/image_picker_dialog.dart';

class ProductForm extends StatefulWidget {
  final ProductView product;
  File file;

  ProductForm({Key key, this.product, @required this.file}) : super(key: key);

  @override
  ProductFormState createState() => ProductFormState(product, file);
}

class ProductFormState extends State<ProductForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final ProductView product;
  File file;

  ProductFormState(this.product, this.file);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            Container(
                width: double.infinity,
                height: 200,
                child: GestureDetector(
                  child: _createPhoto(),
                  onTap: () => _showImagePickerDilog(context),
                )),
            Divider(
              thickness: 1.0,
              height: 30,
            ),
            _createNameField(),
            Divider(
              thickness: 1.0,
              height: 30,
            ),
            _createValueField(),
            Divider(
              thickness: 1.0,
              height: 30,
            ),
            _createAvailability(),
          ],
        ),
      ),
    );
  }

  SwitchListTile _createAvailability() {
    return SwitchListTile(
        title: Text(S.of(context).product_detail_available),
        value: product.available,
        onChanged: (value) {
          setState(() {
            product.available = value;
          });
        });
  }

  Widget _createNameField() {
    return TextFormField(
      initialValue: product.name,
      onSaved: (value) => product.name = value,
      validator: (value) => value.length <= 3 ? "Invalid name " : null,
      decoration: InputDecoration(
          labelText: S.of(context).product_detail_name_label,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
          )),
      textCapitalization: TextCapitalization.sentences,
    );
  }

  Widget _createValueField() {
    return TextFormField(
      initialValue: product.value != null ? product.value.toString() : null,
      onSaved: (value) => product.value = double.parse(value),
      validator: (value) => (value.isEmpty || double.parse(value) <= 0.0)
          ? "Invalid amount"
          : null,
      decoration: InputDecoration(
          labelText: S.of(context).product_detail_value_label,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
          )),
      keyboardType: TextInputType.numberWithOptions(decimal: true),
    );
  }

  Widget _createPhoto() {
    ImageProvider currentImage;
    if (file != null) {
      currentImage = FileImage(file);
    } else {
      if (product.photoUrl != null) {
        currentImage = NetworkImage(product.photoUrl);
      } else {
        currentImage = AssetImage("assets/no-image.png");
      }
    }
    return FadeInImage(
      image: currentImage,
      placeholder: AssetImage("assets/jar-loading.gif"),
    );
  }

  void _showImagePickerDilog(BuildContext context) async {
    ImagePickerResult pickedResult =
        await showModalBottomSheet<ImagePickerResult>(
            context: context,
            builder: (BuildContext context) {
              return ImagePickerDialog();
            });

    if (pickedResult.hasData) {
      setState(() {
        file = File(pickedResult.file.path);
      });
    }
    if (pickedResult.hasError) {
      switch (pickedResult.source) {
        case ImagePickerDialogSource.CAMERA:
          showSnackBarKO(
              Scaffold.of(context), S.of(context).product_detail_camera_error);
          break;
        case ImagePickerDialogSource.GALLERY:
          showSnackBarKO(
              Scaffold.of(context), S.of(context).product_detail_gallery_error);
          break;
      }
    }
  }

  bool validate() => _formKey.currentState.validate();

  void save() {
    _formKey.currentState.save();
  }
}
