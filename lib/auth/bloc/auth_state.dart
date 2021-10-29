part of 'auth_bloc.dart';

@immutable
abstract class AuthState {}

class Unknown extends AuthState {}

class Authenticated extends AuthState {
  final User user;

  Authenticated({required this.user});
}

class UnAuthenticated extends AuthState {}
