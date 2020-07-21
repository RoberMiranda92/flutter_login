import 'package:flutter/material.dart';
import 'package:flutter_login/src/bloc/base_bloc.dart';
import 'package:flutter_login/src/login/bloc/models/login_event.dart';
import 'package:flutter_login/src/login/bloc/models/login_state.dart';
import 'package:flutter_login/src/provider/sesion_provider.dart';
import 'package:flutter_login/src/provider/user_provider.dart';

class LoginBloc extends BaseBloc<LoginEvent, LoginState> {
  static const int LOGIN_BLOC_TYPE = 0;

  final UserProvider userProvider;
  final SessionProvider sessionProvider;

  LoginBloc({@required this.userProvider, @required this.sessionProvider})
      : assert(userProvider != null),
        assert(sessionProvider != null),
        super(LoginInitial());

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    if (event is LoginValidData) {
      yield LoginInProgress();
      try {
        final authResult = await userProvider.doLogin(
          event.email,
          event.password,
        );
        final tokeResult = await authResult.user.getIdToken();
        sessionProvider.token = tokeResult.token;
        sessionProvider.uid = authResult.user.uid;
        yield LoginSuccess();
      } catch (error) {
        yield LoginFailure(error: error.toString());
      }
    }
  }

  @override
  int getType() {
    return LOGIN_BLOC_TYPE;
  }
}
