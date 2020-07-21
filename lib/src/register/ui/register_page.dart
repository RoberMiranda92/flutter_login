import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_login/src/provider/sesion_provider.dart';
import 'package:flutter_login/src/provider/user_provider.dart';
import 'package:flutter_login/src/register/bloc/register_bloc.dart';
import 'package:flutter_login/src/register/ui/register_form.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    BlocProvider.of<RegisterBloc>(context).close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus.unfocus();
        FocusScope.of(context).unfocus();
      },
      child: Stack(
        children: <Widget>[
          _createBackgrond(context),
          _createRegisteWidget(context)
        ],
      ),
    ));
  }

  Widget _createRegisteWidget(BuildContext context) {
    return Center(
      child: BlocProvider(
          lazy: false,
          create: (BuildContext context) {
            return RegisterBloc(
                userProvider: UserProvider.intance,
                sessionProvider: SessionProvider.instance);
          },
          child: RegisterForm()),
    );
  }

  Widget _createBackgrond(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final Widget circle = Container(
        height: size.height * 0.10,
        width: size.height * 0.10,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            color: Color.fromRGBO(255, 255, 255, 0.05)));
    return Stack(children: [
      Container(
        width: size.width,
        height: size.height * 0.4,
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
          Color.fromRGBO(63, 63, 156, 1.0),
          Color.fromRGBO(90, 70, 178, 1.0)
        ])),
      ),
      Positioned(top: -25, right: -20, child: circle),
      Positioned(top: 100, left: 50, child: circle)
    ]);
  }
}
