import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_login/src/api/user_api.dart';

class UserProvider {
  static final UserProvider _instance = UserProvider._(UserApi());

  static get intance => _instance;
  IUserApi _api;

  UserProvider._(this._api);

  Future<AuthResult> doLogin(String email, String password) {
    return _api.signIn(email, password);
  }

  Future<AuthResult> registerUser(String email, String password) {
    return _api.registerUser(email, password);
  }
}
