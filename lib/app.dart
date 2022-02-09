import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wishlist/bloc/login/login_bloc.dart';
import 'package:wishlist/constants.dart';
import 'package:wishlist/features/login/login_screen.dart';
import 'package:wishlist/services/login_repository.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: kAppTitle,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider(
        create: (context) => LoginBloc(LoginRepository()),
        child: const LoginScreen(),
      ),
    );
  }
}
