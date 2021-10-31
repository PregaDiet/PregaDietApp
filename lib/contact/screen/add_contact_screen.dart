import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:prega_diet/app_colors.dart';
import 'package:prega_diet/common/widgets/my_buttons.dart';

class AddContact extends StatefulWidget {
  AddContact({Key? key}) : super(key: key);

  @override
  State<AddContact> createState() => _AddContactState();
}

class _AddContactState extends State<AddContact> {
  final _formKey = GlobalKey<FormState>();
  String countryCode = '+91';

  String phone = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  CountryCodePicker(
                    initialSelection: '+91',
                    onChanged: (val) {
                      print(val.dialCode);
                      print(val.code);
                      setState(() {
                        countryCode = val.dialCode!;
                      });
                    },
                  ),
                  Expanded(
                    child: TextFormField(
                      autofocus: true,
                      maxLength: 10,
                      onTap: () {
                        _formKey.currentState!.deactivate();
                      },
                      onChanged: (val) {
                        setState(() {
                          phone = val;
                        });
                      },
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(), counterText: ''),
                    ),
                  ),
                ],
              ),
              MyButton(
                onTap: () {
                  FocusScope.of(context).unfocus();

                  if (phone.length == 10) {
                    Navigator.pop(context, '$countryCode$phone');
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Length should be 10 digits')));
                  }
                },
                text: 'Add',
                color: AppColors.green,
              )
            ],
          ),
        ),
      ),
    );
  }
}
