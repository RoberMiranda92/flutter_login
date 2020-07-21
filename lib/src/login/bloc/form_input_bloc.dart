import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_login/src/bloc/base_bloc.dart';
import 'package:flutter_login/src/register/bloc/models/login_event.dart';
import 'package:flutter_login/src/register/bloc/register_bloc.dart';
import 'package:meta/meta.dart';

import 'login_bloc.dart';
import 'models/login_event.dart';
import 'models/text_input_event.dart';
import 'models/text_input_state.dart';

class FormValidatorBloc extends Bloc<FormInputEvent, FormInputState> {
  final BaseBloc _authBloc;

  FormValidatorBloc(FormInputState initialState, @required this._authBloc)
      : super(initialState);

  @override
  Stream<FormInputState> mapEventToState(FormInputEvent event) async* {
    if (event is FormInputTyping) {
      yield FormInputInProgress(
          email: event.email,
          password: event.password,
          showPassword: event.showPassword);
    }

    if (event is FormInputValidation) {
      bool isMailInvalid = !_isEmailValid(event.email);
      bool isPasswordInvalid = !_isPasswordValid(event.password);

      if (isMailInvalid || isPasswordInvalid) {
        if (isMailInvalid) {
          yield FormInvalidState(
              error: "Invalid email", type: FormInvalidType.EMAIL);
        } else {
          yield FormInvalidState(
              error: "Invalid password", type: FormInvalidType.PASSWORD);
        }
      }

      if (!isMailInvalid && !isPasswordInvalid) {
        switch (_authBloc.getType()) {
          case LoginBloc.LOGIN_BLOC_TYPE:
            {
              _authBloc.add(
                  LoginValidData(email: event.email, password: event.password));
            }
            break;
          case RegisterBloc.REGISTER_BLOC_TYPE:
            {
              _authBloc.add(RegisterValidData(
                  email: event.email, password: event.password));
            }
        }

        yield FormInputValid(email: event.email, password: event.password);
      }
    }
  }

  bool _isPasswordValid(String password) {
    return password != null && password.length >= 8;
  }

  bool _isEmailValid(String email) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = RegExp(pattern);

    return email != null && regExp.hasMatch(email);
  }
}
