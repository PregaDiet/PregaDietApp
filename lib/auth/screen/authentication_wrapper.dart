import 'package:colco_demo/auth/bloc/auth_bloc.dart';
import 'package:colco_demo/common/screens/loading_screen.dart';
import 'package:colco_demo/home/screens/home_screen.dart';
import 'package:colco_demo/login/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthenticationWrapper extends StatelessWidget {
  const AuthenticationWrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        if (state is Authenticated) {
          return const HomeScreen();
        } else if (state is UnAuthenticated) {
          return const LoginScreen();
        } else {
          return const LoadingScreen();
        }
      },
    );
  }
}
