import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:colco_demo/auth/repository/auth_repositiry.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository repository;

  late StreamSubscription<User?> _userSubscription;

  AuthBloc({required this.repository}) : super(Unknown()) {
    _userSubscription = repository.userChanges.listen((user) {
      add(AuthUserChanged(user: user));
    });
    on((event, emit) {
      if (event is AuthUserChanged) {
        if (event.user != null) {
          emit(Authenticated(user: event.user!));
        } else {
          emit(UnAuthenticated());
        }
      }
    });
  }

  // Stream<AuthState> _checkAuthentication() async* {
  //   final user = _repository.userChanges;

  //   print(user);

  //   user.map((user) async* {
  //     if (user == null) {
  //       yield UnAuthenticated();
  //     } else {
  //       yield Authenticated(user: user);
  //     }
  //   });
  // }
}
