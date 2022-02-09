import 'package:firebase_auth/firebase_auth.dart';

abstract class LoginRepositoryInterface {
  Future<UserCredential> login();
}

class LoginRepository extends LoginRepositoryInterface {
  @override
  Future<UserCredential> login() async {
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.signInAnonymously();
      return userCredential;
    } catch (e) {
      rethrow;
    }
  }
}
