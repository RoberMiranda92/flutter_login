import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_login/generated/l10n.dart';
import 'package:flutter_login/src/login/bloc/form_input_bloc.dart';
import 'package:flutter_login/src/login/bloc/models/text_input_event.dart';
import 'package:flutter_login/src/login/bloc/models/text_input_state.dart';

import 'form_controller.dart';

class PasswordInput extends StatefulWidget {
  final FormController _controller;

  PasswordInput({Key key, FormController controller})
      : assert(controller != null),
        this._controller = controller,
        super(key: key);

  @override
  PasswordInputState createState() =>
      PasswordInputState(controller: _controller);
}

class PasswordInputState extends State<PasswordInput> {
  final FormController _controller;
  bool _showPassword = false;

  PasswordInputState({@required FormController controller})
      : this._controller = controller;

  @override
  Widget build(BuildContext context) {
    return BlocListener<FormValidatorBloc, FormInputState>(
      listener: (BuildContext context, FormInputState state) {},
      child: BlocBuilder<FormValidatorBloc, FormInputState>(
        builder: (BuildContext context, FormInputState state) {
          return TextField(
            obscureText: !_showPassword,
            controller: _controller.passwordController,
            onChanged: (value) {
              BlocProvider.of<FormValidatorBloc>(context).add(FormInputTyping(
                  email: _controller.emailValue,
                  password: value,
                  showPassword: _showPassword));
            },
            decoration: InputDecoration(
                errorText: state is FormInvalidState &&
                        state.type == FormInvalidType.PASSWORD
                    ? state.error
                    : null,
                icon: Icon(Icons.lock),
                suffixIcon: IconButton(
                  icon: Icon(
                    state is FormInputInProgress
                        ? _tooglePassword(state.showPassword)
                        : _tooglePassword(false),
                  ),
                  onPressed: () => {
                    _showPassword = !_showPassword,
                    BlocProvider.of<FormValidatorBloc>(context).add(
                        FormInputTyping(
                            email: _controller.emailValue,
                            password: _controller.passwordValue,
                            showPassword: _showPassword))
                  },
                ),
                labelText: S.of(context).login_password_label),
          );
        },
      ),
    );
  }

  IconData _tooglePassword(bool showPassword) {
    if (showPassword) {
      return Icons.visibility;
    } else {
      return Icons.visibility_off;
    }
  }
}
