import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prega_diet/common/model/load_status.enum.dart';
import 'package:prega_diet/common/screen/loading_screen.dart';
import 'package:prega_diet/login/cubit/login_cubit.dart';

import '../../homescreen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();

  String email = '';
  String password = '';
  String firstName = '';
  String lastName = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign Up'),
      ),
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
            return Form(
              key: _formKey,
              child: Column(
                children: [
                  Spacer(),
                  TextFormField(
                    validator: (val) {
                      // if (val == null || !val.contains('@') || val.isEmpty) {
                      //   return 'Invalid email';
                      // }
                    },
                    onChanged: (val) {
                      setState(() {
                        firstName = val;
                      });
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'First Name',
                    ),
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    validator: (val) {
                      // if (val == null || !val.contains('@') || val.isEmpty) {
                      //   return 'Invalid email';
                      // }
                    },
                    onChanged: (val) {
                      setState(() {
                        lastName = val;
                      });
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Last Name',
                    ),
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    validator: (val) {
                      if (val == null || !val.contains('@') || val.isEmpty) {
                        return 'Invalid email';
                      }
                    },
                    onChanged: (val) {
                      setState(() {
                        email = val;
                      });
                    },
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
                    decoration: InputDecoration(
                      labelText: 'Password',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        await context.read<LoginCubit>().signUp(
                              email: email,
                              password: password,
                              firstName: firstName,
                              lastName: lastName,
                            );
                        Navigator.pop(context);
                      }
                    },
                    child: Text('Sign Up'),
                  ),
                  Spacer(),
                ],
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
