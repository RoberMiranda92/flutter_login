import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_login/src/api/storage.dart';
import 'package:flutter_login/src/ui/utils/ui_utils.dart';
import 'package:uuid/uuid.dart';

class ImageStorage implements Storage {
  final _storage = FirebaseStorage.instance;

  @override
  Future<UploadFileResult> uploadFile(File file) async {
    final String uuid = Uuid().v1();

    StorageReference reference =
        _storage.ref().child("images/$uuid${getFileExtension(file)}");

    StorageUploadTask uploadTask = reference.putFile(file);
    var result = await uploadTask.onComplete;

    return UploadFileResult(
        name: await result.ref.getName(),
        url: await result.ref.getDownloadURL());
  }

  @override
  Future<dynamic> deleteFile(String fileName) {
    StorageReference reference = _storage.ref().child("images/$fileName");
    return reference.delete();
  }
}
