import 'package:flutter/material.dart';
import 'package:wishlist/bloc/login/login_bloc.dart';
import 'package:wishlist/bloc/login/login_event.dart';
import 'package:wishlist/bloc/login/login_state.dart';
import 'package:wishlist/constants.dart';
import 'package:wishlist/features/dashboard/wishlist_dashboard.dart';
import 'package:wishlist/services/wishlist_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

const _kTitleTextStyle = TextStyle(fontSize: 32, color: Colors.white);

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _automaticallyLoginIfNeeded();
  }

  _automaticallyLoginIfNeeded() async {
    _automaticallyLoginIfNeeded();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener(
      bloc: BlocProvider.of<LoginBloc>(context),
      listener: (context, state) {
        if (state is LoginSuccess) {
          _presentWishlistDashboard(context);
        }
      },
      child: _buildLoginContainer(context),
    );
  }

  Material _buildLoginContainer(BuildContext context) {
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
      onPressed: () async {
        context.read<LoginBloc>().add(LoginEvents.loginButtonTapped);
      },
      child: const Text('Login'),
    );
  }

  void _presentWishlistDashboard(BuildContext context) {
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
