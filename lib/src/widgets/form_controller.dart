import 'package:flutter/material.dart';

class FormController {
  TextEditingController emailController;
  TextEditingController passwordController;

  FormController(
      {@required this.emailController, @required this.passwordController});

  String get emailValue => emailController.text;
  String get passwordValue => passwordController.text;
}
