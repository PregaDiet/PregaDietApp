import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../app_colors.dart';
import '../../common/widgets/my_buttons.dart';
import '../../login/cubit/login_cubit.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Spacer(),
          Text(
            context.read<LoginCubit>().state.userDetails.firstName,
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            context.read<LoginCubit>().state.userDetails.lastName,
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          MyButton(
            text: 'Sign out',
            onTap: () {
              context.read<LoginCubit>().signOut();
            },
            color: AppColors.orange,
          ),
          Spacer(),
        ],
      ),
    );
  }
}
