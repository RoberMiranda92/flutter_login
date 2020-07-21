import 'dart:io';

import 'package:flutter_login/src/api/image_api.dart';
import 'package:flutter_login/src/api/storage.dart';

class FileProvider {
  static final FileProvider _instance = FileProvider._(ImageStorage());

  Storage _imageStorage;
  FileProvider._(this._imageStorage);


  static FileProvider get instance => _instance;

  Future<UploadFileResult> uploadFile(File file) {
    return _imageStorage.uploadFile(file);
  }

  Future<void> deleteFile(String name) {
    return _imageStorage.deleteFile(name);
  }
}
