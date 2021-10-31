import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prega_diet/contact/cubit/contact_cubit.dart';
import 'package:prega_diet/contact/repository/contact_repository.dart';
import 'package:prega_diet/contact/screen/aasha_screen.dart';
import 'package:prega_diet/login/cubit/login_cubit.dart';

class EmergencyButton extends StatelessWidget {
  const EmergencyButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        final city = context.read<LoginCubit>().state.userDetails.city;
        final result = await context.read<ContactRepository>().getAasha(city);

        if (result != null) {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => AashaScreen(contact: result)));
        }
      },
      child: Container(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.medical_services,
              color: Colors.white,
              size: 30,
            ),
            SizedBox(height: 5),
            Text(
              'Talk with Doctor',
              style: TextStyle(
                  fontSize: 30,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
            // SizedBox(height: 5),
            // Text(
            //   'Talk with Doctor',
            //   style: TextStyle(
            //     fontSize: 20,
            //     color: Colors.white,
            //   ),
            // ),
          ],
        ),
        alignment: Alignment.center,
        height: 200,
        width: MediaQuery.of(context).size.width / 1.5,
        decoration: BoxDecoration(
          color: Colors.red,
          gradient: RadialGradient(
            colors: [
              Color(0xff2FB7C3),
              Color(0xff322775),
            ],
            radius: 30,
          ),
          borderRadius: BorderRadius.circular(5),
        ),
      ),
    );
  }
}
