import 'package:flutter/material.dart';
import 'package:flutter_login/src/bloc/base_bloc.dart';
import 'package:flutter_login/src/provider/sesion_provider.dart';
import 'package:flutter_login/src/provider/user_provider.dart';
import 'models/login_event.dart';
import 'models/login_state.dart';

class RegisterBloc extends BaseBloc<RegisterEvent, RegisterState> {
  static const int REGISTER_BLOC_TYPE = 1;

  final UserProvider userProvider;
  final SessionProvider sessionProvider;

  RegisterBloc({@required this.userProvider, @required this.sessionProvider})
      : assert(userProvider != null),
        assert(sessionProvider != null),
        super(RegisterInitial());

  @override
  Stream<RegisterState> mapEventToState(RegisterEvent event) async* {
    if (event is RegisterValidData) {
      yield RegisterInProgress();
      try {
        final authResult = await userProvider.registerUser(
          event.email,
          event.password,
        );
        final tokeResult = await authResult.user.getIdToken();
        sessionProvider.token = tokeResult.token;
        yield RegisterSuccess();
      } catch (error) {
        yield RegisterFailure(error: error.toString());
      }
    }
  }

  @override
  int getType() {
    return REGISTER_BLOC_TYPE;
  }
}
