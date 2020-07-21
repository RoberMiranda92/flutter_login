import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_login/generated/l10n.dart';
import 'package:flutter_login/src/login/bloc/form_input_bloc.dart';
import 'package:flutter_login/src/login/bloc/login_bloc.dart';
import 'package:flutter_login/src/login/bloc/models/login_state.dart';
import 'package:flutter_login/src/login/bloc/models/text_input_event.dart';
import 'package:flutter_login/src/login/bloc/models/text_input_state.dart';

import 'package:flutter_login/src/register/ui/register_page.dart';
import 'package:flutter_login/src/ui/routes.dart';
import 'package:flutter_login/src/ui/utils/ui_utils.dart';
import 'package:flutter_login/src/widgets/email_input.dart';
import 'package:flutter_login/src/widgets/form_controller.dart';
import 'package:flutter_login/src/widgets/password_input.dart';

class LoginForm extends StatefulWidget {
  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final FormController _formController = FormController(
      emailController: TextEditingController(),
      passwordController: TextEditingController());

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state is LoginFailure) {
          showSnackBarKO(Scaffold.of(context), state.error);
        }
        if (state is LoginSuccess) {
          Navigator.popAndPushNamed(context, Routes.PRODUCT_LIST);
        }
      },
      child: BlocBuilder<LoginBloc, LoginState>(
        builder: (context, state) {
          Widget formChild;

          if (state is LoginInProgress) {
            formChild = Center(child: CircularProgressIndicator());
          } else {
            formChild = BlocProvider(
                lazy: false,
                create: (BuildContext context) {
                  return FormValidatorBloc(
                      FormInputEmpty(), BlocProvider.of<LoginBloc>(context));
                },
                child: Column(children: <Widget>[
                  Text(
                    S.of(context).login_title,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 20.0),
                  ),
                  SizedBox(height: 20),
                  EmailInput(controller: _formController),
                  SizedBox(height: 10),
                  PasswordInput(controller: _formController),
                  SizedBox(height: 10),
                  Builder(
                    builder: (context) => _createLoginButton(context, state),
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
                Text(S.of(context).login_password_forgotten),
                SizedBox(
                  height: 20,
                ),
                FlatButton(
                  child: Text(
                    S.of(context).login_register_button,
                    style: TextStyle(color: Theme.of(context).accentColor),
                  ),
                  onPressed: () {
                    Navigator.of(context).push(_createRoute());
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _createLoginButton(BuildContext context, LoginState state) {
    return RaisedButton(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Text(
        S.of(context).login_title,
        textAlign: TextAlign.center,
        style: TextStyle(color: Colors.white),
      ),
      onPressed: state is! LoginInProgress
          ? () => _onLoginButtonPressed(context)
          : null,
      color: Colors.deepPurple,
    );
  }

  void _onLoginButtonPressed(BuildContext context) {
    BlocProvider.of<FormValidatorBloc>(context).add(FormInputValidation(
        email: _formController.emailValue,
        password: _formController.passwordValue));
  }

  Route _createRoute() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => RegisterPage(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        var begin = Offset(1.0, 0.0);
        var end = Offset(0.0, 0.0);
        var curve = Curves.linear;

        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }
}
