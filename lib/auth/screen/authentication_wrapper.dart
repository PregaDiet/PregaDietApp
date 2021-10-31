import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/auth_bloc.dart';
import 'user_details_wrapper.dart';
import '../../auth_screen.dart';
import '../../common/screen/loading_screen.dart';
import '../../login/cubit/login_cubit.dart';
import '../../login/repository/login_repository.dart';
import '../../login/screens/login_screen.dart';

import '../../homescreen.dart';

class AuthenticationWrapper extends StatelessWidget {
  const AuthenticationWrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        if (state is Authenticated) {
          return UserDetailsWrapper();
        } else if (state is UnAuthenticated) {
          return AuthScreen();
        } else {
          return const LoadingScreen();
        }
      },
    );
  }
}
