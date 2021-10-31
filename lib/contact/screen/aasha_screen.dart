import 'package:flutter/material.dart';
import 'package:prega_diet/app_colors.dart';
import 'package:prega_diet/common/widgets/my_buttons.dart';
import 'package:prega_diet/contact/model/aasha_contact.dart';
import 'package:url_launcher/url_launcher.dart';

class AashaScreen extends StatelessWidget {
  const AashaScreen({Key? key, required this.contact}) : super(key: key);
  final AashaContact contact;
  void _call(String number) async {
    final url = 'tel:$number';
    await canLaunch(url) ? await launch(url) : throw 'Could not launch $url';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              contact.name,
              style: TextStyle(
                color: Colors.black87,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(
              contact.phone,
              style: TextStyle(
                color: Colors.black87,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            MyButton(
                onTap: () {
                  _call(contact.phone);
                },
                color: AppColors.orange,
                text: 'Call')
          ],
        ),
      ),
    );
  }
}
