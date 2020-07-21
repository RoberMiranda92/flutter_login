import 'package:meta/meta.dart';

abstract class FormInputEvent {
  const FormInputEvent();
}

class FormInputTyping extends FormInputEvent {
  final String email;
  final String password;
  final bool showPassword;

  const FormInputTyping(
      {@required this.email,
      @required this.password,
      @required this.showPassword});

  @override
  String toString() =>
      'FormInputTyping { email: $email password $password  showPassword $showPassword}';
}

class FormInputValidation extends FormInputEvent {
  final String email;
  final String password;

  const FormInputValidation({@required this.email, @required this.password});

  @override
  String toString() =>
      'FormInputValidation { email: $email password $password }';
}
