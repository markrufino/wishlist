import 'package:firebase_auth/firebase_auth.dart';

abstract class LoginRepositoryInterface {
  Future<bool> isLoggedIn();
  Future<UserCredential> login();
}

class LoginRepository extends LoginRepositoryInterface {
  @override
  Future<UserCredential> login() async {
    UserCredential userCredential =
        await FirebaseAuth.instance.signInAnonymously();
    return userCredential;
  }

  @override
  Future<bool> isLoggedIn() async {
    User? result = FirebaseAuth.instance.currentUser;
    return result != null;
  }
}
