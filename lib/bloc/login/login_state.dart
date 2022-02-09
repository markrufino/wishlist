import 'package:equatable/equatable.dart';

abstract class LoginState {}

class LoginInitialState extends LoginState {}

class LoginLoading extends LoginState {}

class LoginSuccess extends LoginState {}

class LogoutLoading extends LoginState {}

class LogoutSuccess extends LoginState {}

class LoginError extends LoginState {}
