import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_login/generated/l10n.dart';
import 'package:flutter_login/src/login/bloc/form_input_bloc.dart';
import 'package:flutter_login/src/login/bloc/models/text_input_event.dart';
import 'package:flutter_login/src/login/bloc/models/text_input_state.dart';

import 'form_controller.dart';

class EmailInput extends StatefulWidget {
  final FormController _controller;

  EmailInput({Key key, FormController controller})
      : assert(controller != null),
        this._controller = controller,
        super(key: key);

  @override
  EmailInputState createState() => EmailInputState(controller: _controller);
}

class EmailInputState extends State<EmailInput> {
  final FormController _controller;

  EmailInputState({@required FormController controller})
      : _controller = controller;

  @override
  Widget build(BuildContext context) {
    return BlocListener<FormValidatorBloc, FormInputState>(
      listener: (BuildContext context, FormInputState state) {},
      child: BlocBuilder<FormValidatorBloc, FormInputState>(
        builder: (BuildContext context, FormInputState state) {
          return TextField(
            onChanged: (value) {
              BlocProvider.of<FormValidatorBloc>(context).add(FormInputTyping(
                  email: value,
                  password: _controller.passwordValue,
                  showPassword: false));
            },
            controller: _controller.emailController,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
                errorText: state is FormInvalidState &&
                        state.type == FormInvalidType.EMAIL
                    ? state.error
                    : null,
                hintText: S.of(context).login_email_hint,
                icon: Icon(Icons.email),
                labelText: S.of(context).login_email_label),
          );
        },
      ),
    );
  }

  String _getEmailError(BuildContext context){
    return S.of(context).login_title;
  }
}
