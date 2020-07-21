import 'dart:io';

import 'package:flutter/material.dart';

void showSnackBarOK(ScaffoldState state, String message) {
  final snackBar = SnackBar(
    content: Text(message),
    duration: Duration(seconds: 2),
    backgroundColor: Colors.green,
  );
  state.removeCurrentSnackBar();
  state.showSnackBar(snackBar);
}

void showSnackBarKO(ScaffoldState state, String message) {
  
  final snackBar = SnackBar(
    content: Text(message),
    duration: Duration(seconds: 2),
    backgroundColor: Colors.red,
  );
  state.removeCurrentSnackBar();
  state.showSnackBar(snackBar);
}

String getFileExtension(File file){
    String path = file.path;
    
    return path.substring(path.lastIndexOf("."));
}
