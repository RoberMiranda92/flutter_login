import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

abstract class FormInputState{
  const FormInputState();
}

class FormInputEmpty extends FormInputState{}

class FormInputInProgress extends FormInputState {
  final String email;
  final String password;
  final bool showPassword;

  const FormInputInProgress(
      {@required this.email,
      @required this.password,
      @required this.showPassword});

  @override
  String toString() =>
      'FormInputInProgress { email: $email, password $password, showPassword $showPassword}';
}

class FormInvalidState extends FormInputState {
  final String error;
  final FormInvalidType type;

  const FormInvalidState({@required this.error, @required this.type});

  @override
  String toString() => 'FormInvalidState { error: $error type: $type}';
}

enum FormInvalidType{EMAIL, PASSWORD}

class FormInputValid extends FormInputState {
  final String email;
  final String password;

  const FormInputValid({@required this.email, this.password});

  @override
  String toString() => 'FormInputValid { email: $email, password $password';
}
