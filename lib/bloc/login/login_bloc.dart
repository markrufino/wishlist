import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wishlist/bloc/login/login_event.dart';
import 'package:wishlist/bloc/login/login_state.dart';
import 'package:wishlist/services/login_repository.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginRepositoryInterface repo;

  LoginBloc(this.repo) : super(LoginInitialState()) {
    on<LoginButtonTapped>((event, emit) async {
      emit(LoginLoading());
      await repo.login();
      emit(LoginSuccess());
    });
  }
}
