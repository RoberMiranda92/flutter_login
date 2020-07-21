import 'package:firebase_auth/firebase_auth.dart';

mixin IUserApi {
  Future registerUser(String email, String password);

  Future signIn(String email, String password);
}

class UserApi implements IUserApi{
  
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Future<AuthResult> registerUser(String email, String password) {
    return _auth.createUserWithEmailAndPassword(email: email, password: password);
  }

  @override
  Future<AuthResult> signIn(String email, String password) {
        return _auth.signInWithEmailAndPassword(email: email, password: password);

  }

}