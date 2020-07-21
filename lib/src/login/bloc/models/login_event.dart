
import 'package:meta/meta.dart';

abstract class LoginEvent {
  const LoginEvent();
}

class LoginValidData extends LoginEvent {
  final String email;
  final String password;

  const LoginValidData({
    @required this.email,
    @required this.password,
  });

  @override
  String toString() =>
      'LoginValidData { username: $email, password: $password }';
}