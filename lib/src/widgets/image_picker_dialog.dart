import 'package:flutter/material.dart';
import 'package:flutter_login/generated/l10n.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerDialog extends StatelessWidget {
  final Function onError;
  final ImagePicker _imagePicker = ImagePicker();

  ImagePickerDialog({Key key, this.onError}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Container(
      child: Wrap(children: <Widget>[
        ListTile(
            leading: Icon(Icons.camera_alt),
            title: Text(S.of(context).product_detail_camera),
            onTap: () {
              _navigateToCamera(context);
            }),
        ListTile(
            leading: Icon(Icons.photo),
            title: Text(S.of(context).product_detail_gallery),
            onTap: () {
              _navigateToGallery(context);
              //Navigator.pop(context, );
            })
      ]),
    ));
  }

  void _navigateToCamera(BuildContext context) =>
      _pickImage(context, ImageSource.camera);

  void _navigateToGallery(BuildContext context) =>
      _pickImage(context, ImageSource.gallery);

  void _pickImage(BuildContext context, ImageSource source) async {
    ImagePickerResult result = ImagePickerResult.empty();
    result.source = source == ImageSource.camera
        ? ImagePickerDialogSource.CAMERA
        : ImagePickerDialogSource.GALLERY;
    try {
      Navigator.pop(
          context, result..file = await _imagePicker.getImage(source: source));
    } catch (error, stackTrace) {
      Navigator.pop(context, result..error = error);
    }
  }
}

class ImagePickerResult {
  PickedFile file;
  ImagePickerDialogSource source;
  String error;

  ImagePickerResult.empty();

  ImagePickerResult(this.file, this.source, this.error);

  bool get hasData => file != null;

  bool get hasError => error != null && error.isNotEmpty;
}

enum ImagePickerDialogSource { CAMERA, GALLERY }
