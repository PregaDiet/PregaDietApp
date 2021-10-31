import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../app_colors.dart';
import '../../common/model/load_status.enum.dart';
import '../../common/screen/loading_screen.dart';
import '../../common/widgets/my_buttons.dart';
import '../cubit/login_cubit.dart';

import '../../homescreen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<LoginCubit, LoginState>(
        listener: (context, state) {
          if (state.loadStatus == LoadStatus.error) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text('Login Failed')));
          }
        },
        builder: (context, state) {
          if (state.loadStatus == LoadStatus.initial ||
              state.loadStatus == LoadStatus.error) {
            return SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Spacer(),
                      Text(
                        'Login',
                        style: TextStyle(
                          fontWeight: FontWeight.w800,
                          fontSize: 60,
                          color: Colors.black87,
                        ),
                      ),
                      SizedBox(
                        height: 100,
                      ),
                      TextFormField(
                        autofocus: true,
                        validator: (val) {
                          if (val == null ||
                              !val.contains('@') ||
                              val.isEmpty) {
                            return 'Invalid email';
                          }
                        },
                        onChanged: (val) {
                          setState(() {
                            email = val;
                          });
                        },
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Email',
                        ),
                      ),
                      SizedBox(height: 20),
                      TextFormField(
                        validator: (val) {
                          if (val == null || val.isEmpty) {
                            return 'Invalid password';
                          }
                        },
                        onChanged: (val) {
                          setState(() {
                            password = val;
                          });
                        },
                        keyboardType: TextInputType.visiblePassword,
                        obscureText: true,
                        decoration: InputDecoration(
                          labelText: 'Password',
                          border: OutlineInputBorder(),
                        ),
                      ),
                      SizedBox(height: 20),
                      MyButton(
                        onTap: () async {
                          FocusScopeNode().unfocus();
                          if (_formKey.currentState!.validate()) {
                            await context
                                .read<LoginCubit>()
                                .signIn(email: email, password: password);
                            Navigator.pop(context);
                          }
                        },
                        text: 'Login',
                        color: AppColors.orange,
                      ),
                      Spacer(),
                    ],
                  ),
                ),
              ),
            );
          } else if (state.loadStatus == LoadStatus.loading) {
            return LoadingScreen();
          } else {
            return HomeScreen();
          }
        },
      ),
    );
  }
}
