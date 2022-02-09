import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wishlist/bloc/login/login_event.dart';
import 'package:wishlist/bloc/login/login_state.dart';
import 'package:wishlist/services/login_repository.dart';

class LoginBloc extends Bloc<LoginEvents, LoginState> {
  final LoginRepositoryInterface repo;

  LoginBloc(this.repo) : super(LoginInitialState());

  @override
  Stream<LoginState> mapEventToState(LoginEvents event) async* {
    switch (event) {
      case LoginEvents.loginButtonTapped:
        yield LoginLoading();
        try {
          await repo.login();
          yield LoginSuccess();
        } catch (e) {
          yield LoginError();
        }
        break;
    }
  }
}
