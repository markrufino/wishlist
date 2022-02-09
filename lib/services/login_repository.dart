import 'package:firebase_auth/firebase_auth.dart';
import 'package:wishlist/models/wish_model.dart';

abstract class LoginRepositoryInterface {
  Future<UserCredential> login();
}

class LoginRepository extends LoginRepositoryInterface {
  @override
  Future<UserCredential> login() async {
    UserCredential userCredential =
        await FirebaseAuth.instance.signInAnonymously();
    return userCredential;
  }
}
