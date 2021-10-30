import 'package:flutter/material.dart';
import 'package:prega_diet/app_colors.dart';
import 'package:prega_diet/login/screens/login_screen.dart';

import 'signUp/screen/sign_up_screen.dart';

class AuthScreen extends StatefulWidget {
  AuthScreen({Key? key}) : super(key: key);

  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Spacer(),
            Text(
              'Welcome to',
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 60,
                color: Colors.black87,
                fontStyle: FontStyle.italic,
              ),
            ),
            Text(
              'Prega Diet',
              style: TextStyle(
                fontWeight: FontWeight.w800,
                fontSize: 60,
                color: AppColors.green,
              ),
            ),
            Spacer(),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => LoginScreen()));
              },
              child: Text('Login'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SignUpScreen()));
              },
              child: Text('Sign Up'),
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
