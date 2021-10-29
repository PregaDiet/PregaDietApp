part of 'auth_bloc.dart';

@immutable
abstract class AuthEvent extends Equatable {}

class AuthUserChanged extends AuthEvent {
  final User? user;
  AuthUserChanged({required this.user});

  @override
  List<Object?> get props => [user];
}
