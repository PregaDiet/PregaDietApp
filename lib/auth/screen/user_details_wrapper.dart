import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../common/screen/loading_screen.dart';
import '../../homescreen.dart';
import '../../login/cubit/login_cubit.dart';
import '../../login/repository/login_repository.dart';

class UserDetailsWrapper extends StatelessWidget {
  const UserDetailsWrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
          future: context.read<LoginCubit>().getUserDetails(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return HomeScreen();
            }

            if (snapshot.connectionState == ConnectionState.waiting) {
              return LoadingScreen();
            }
            return SizedBox();
          }),
    );
  }
}
