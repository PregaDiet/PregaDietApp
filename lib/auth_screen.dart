import 'package:flutter/material.dart';
import 'app_colors.dart';
import 'login/screens/login_screen.dart';

import 'common/widgets/my_buttons.dart';
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
            MyButton(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => LoginScreen()));
              },
              color: AppColors.orange,
              text: 'Login',
            ),
            SizedBox(height: 10),
            MyButton(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SignUpScreen()));
              },
              text: 'Sign Up',
              color: AppColors.orange,
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
