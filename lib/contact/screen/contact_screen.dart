import 'package:flutter/material.dart';
import 'package:prega_diet/contact/screen/widgets/emergency_contacts_widget.dart';
import 'widgets/emergency_button.dart';

class ContactScreen extends StatelessWidget {
  const ContactScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Column(
          children: [
            SizedBox(height: 50),
            EmergencyButton(),
            SizedBox(height: 50),
            Container(
              width: MediaQuery.of(context).size.width / 1.5,
              height: 100,
              alignment: Alignment.center,
              decoration: BoxDecoration(color: Colors.blue),
              child: Text(
                'Notify Contacts',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(height: 50),
            EmergencyContactsWidget(),
          ],
        ),
      ),
    );
  }
}
