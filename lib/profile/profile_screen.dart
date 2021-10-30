import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prega_diet/login/cubit/login_cubit.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(context.read<LoginCubit>().state.userDetails.firstName),
          ElevatedButton(
            child: Text('Sign out'),
            onPressed: () {
              context.read<LoginCubit>().signOut();
            },
          ),
        ],
      ),
    );
  }
}
