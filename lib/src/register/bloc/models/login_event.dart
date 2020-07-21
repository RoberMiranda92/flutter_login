
import 'package:meta/meta.dart';

abstract class RegisterEvent {
  const RegisterEvent();
}

class RegisterValidData extends RegisterEvent {
  final String email;
  final String password;

  const RegisterValidData({
    @required this.email,
    @required this.password,
  });

  @override
  String toString() =>
      'RegisterEvent { username: $email, password: $password }';
}