import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_login/generated/l10n.dart';
import 'package:flutter_login/src/login/bloc/form_input_bloc.dart';
import 'package:flutter_login/src/login/bloc/login_bloc.dart';
import 'package:flutter_login/src/login/bloc/models/login_state.dart';
import 'package:flutter_login/src/login/bloc/models/text_input_event.dart';
import 'package:flutter_login/src/login/bloc/models/text_input_state.dart';
import 'package:flutter_login/src/register/bloc/models/login_state.dart';
import 'package:flutter_login/src/register/bloc/register_bloc.dart';
import 'package:flutter_login/src/ui/routes.dart';
import 'package:flutter_login/src/widgets/email_input.dart';
import 'package:flutter_login/src/widgets/form_controller.dart';
import 'package:flutter_login/src/widgets/password_input.dart';

class RegisterForm extends StatefulWidget {
  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final FormController _formController = FormController(
      emailController: TextEditingController(),
      passwordController: TextEditingController());

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return BlocListener<RegisterBloc, RegisterState>(
      listener: (context, state) {
        if (state is RegisterFailure) {
          Scaffold.of(context).showSnackBar(
            SnackBar(
              content: Text('${state.error}'),
              backgroundColor: Colors.red,
            ),
          );
        }
        if (state is RegisterSuccess) {
          Navigator.popAndPushNamed(context, Routes.PRODUCT_LIST);
        }
      },
      child: BlocBuilder<RegisterBloc, RegisterState>(
        builder: (context, state) {
          Widget formChild;

          if (state is RegisterInProgress) {
            formChild = Center(child: CircularProgressIndicator());
          } else {
            formChild = BlocProvider(
                lazy: false,
                create: (BuildContext context) {
                  return FormValidatorBloc(
                      FormInputEmpty(), BlocProvider.of<RegisterBloc>(context));
                },
                child: Column(children: <Widget>[
                  Text(
                    S.of(context).register_title,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 20.0),
                  ),
                  SizedBox(height: 20),
                  EmailInput(controller: _formController),
                  SizedBox(height: 10),
                  PasswordInput(controller: _formController),
                  SizedBox(height: 10),
                  Builder(
                    builder: (context) => _createRegisterButton(context, state),
                  )
                ]));
          }

          return SingleChildScrollView(
            padding: EdgeInsets.all(10),
            child: Column(
              children: <Widget>[
                Container(
                  child: Icon(
                    Icons.person_pin_circle,
                    size: 100,
                    color: Colors.white,
                  ),
                ),
                Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black26,
                              blurRadius: 3.0,
                              offset: Offset(0.0, 3))
                        ],
                        borderRadius: BorderRadius.circular(30)),
                    width: size.width * 0.85,
                    padding: EdgeInsets.only(
                        top: 50, left: 20, right: 20, bottom: 20),
                    child: formChild),
                SizedBox(
                  height: 20,
                ),
                FlatButton(
                  child: Text(
                    S.of(context).register_go_login,
                    style: TextStyle(color: Theme.of(context).accentColor),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _createRegisterButton(BuildContext context, RegisterState state) {
    return RaisedButton(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Text(
        S.of(context).register_title,
        textAlign: TextAlign.center,
        style: TextStyle(color: Colors.white),
      ),
      onPressed: state is! RegisterInProgress
          ? () => _onRegisterButtonPressed(context)
          : null,
      color: Colors.deepPurple,
    );
  }

  void _onRegisterButtonPressed(BuildContext context) {
    BlocProvider.of<FormValidatorBloc>(context).add(FormInputValidation(
        email: _formController.emailValue,
        password: _formController.passwordValue));
  }
}
