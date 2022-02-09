import 'package:flutter/material.dart';
import 'package:wishlist/constants.dart';
import 'package:wishlist/features/dashboard/wishlist_dashboard.dart';
import 'package:wishlist/services/login_repository.dart';
import 'package:wishlist/services/wishlist_repository.dart';

const _kTitleTextStyle = TextStyle(fontSize: 32, color: Colors.white);

class LoginScreen extends StatelessWidget {
  final LoginRepositoryInterface repo;

  const LoginScreen({Key? key, required this.repo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        color: Colors.blue,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildTitle(),
            _buildLoginButton(context),
          ],
        ),
      ),
    );
  }

  Text _buildTitle() {
    return const Text(
      kAppTitle,
      style: _kTitleTextStyle,
    );
  }

  ElevatedButton _buildLoginButton(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(primary: Colors.redAccent),
      onPressed: () {
        presentWishlistDashboard(context);
      },
      child: const Text('Login'),
    );
  }

  void presentWishlistDashboard(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => WishlistDashboard(
          repo: WishlistRepository(),
        ),
      ),
    );
  }
}
