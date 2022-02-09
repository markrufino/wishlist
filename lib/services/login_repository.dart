import 'package:firebase_auth/firebase_auth.dart';

abstract class LoginRepositoryInterface {
  Future<bool> isLoggedIn();
  Future<UserCredential> login();
  Future<void> logout();
}

class LoginRepository extends LoginRepositoryInterface {
  @override
  Future<UserCredential> login() async {
    UserCredential userCredential =
        await FirebaseAuth.instance.signInAnonymously();
    print(userCredential.user?.uid ?? '');
    return userCredential;
  }

  @override
  Future<bool> isLoggedIn() async {
    User? result = FirebaseAuth.instance.currentUser;
    return result != null;
  }

  @override
  Future<void> logout() async {
    await FirebaseAuth.instance.signOut();
    return;
  }
}
