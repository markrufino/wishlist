import 'package:wishlist/models/wish_model.dart';

class LoginRepository {
  Future<void> login() {
    return Future.delayed(const Duration(seconds: 12), () {
      return;
    });
  }
}
