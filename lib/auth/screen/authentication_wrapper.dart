import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prega_diet/auth/bloc/auth_bloc.dart';
import 'package:prega_diet/auth_screen.dart';
import 'package:prega_diet/common/screen/loading_screen.dart';
import 'package:prega_diet/login/screens/login_screen.dart';

import '../../homescreen.dart';

class AuthenticationWrapper extends StatelessWidget {
  const AuthenticationWrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        if (state is Authenticated) {
          return const HomeScreen();
        } else if (state is UnAuthenticated) {
          return AuthScreen();
        } else {
          return const LoadingScreen();
        }
      },
    );
  }
}
