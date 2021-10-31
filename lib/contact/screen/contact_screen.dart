import 'package:flutter/material.dart';
import 'package:prega_diet/contact/screen/widgets/emergency_contacts_widget.dart';
import 'package:prega_diet/contact/screen/widgets/notify_contacts_button.dart';
import 'widgets/emergency_button.dart';

class ContactScreen extends StatelessWidget {
  const ContactScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              EmergencyButton(),
              SizedBox(height: 20),
              NotifyContactsButon(),
              SizedBox(height: 20),
              EmergencyContactsWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
