import 'package:flutter/material.dart';
import 'package:wishlist/features/dashboard/wishlist_dashboard.dart';
import 'package:wishlist/features/login/login_screen.dart';
import 'package:wishlist/services/login_repository.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wishlist Tracker',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginScreen(
        repo: LoginRepository(),
      ),
    );
  }
}
