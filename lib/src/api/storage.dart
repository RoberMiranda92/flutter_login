import 'dart:io';

mixin Storage {
  Future<UploadFileResult> uploadFile(File file);

  Future<void> deleteFile(String fileName);
}

class UploadFileResult {
  final String name;
  final String url;

  UploadFileResult({this.name, this.url});
}
