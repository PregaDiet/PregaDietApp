import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prega_diet/contact/cubit/contact_cubit.dart';
import 'package:prega_diet/login/cubit/login_cubit.dart';

class NotifyContactsButon extends StatelessWidget {
  const NotifyContactsButon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        final details = context.read<LoginCubit>().state.userDetails;
        final name = details.firstName + '' + details.lastName;
        context.read<ContactCubit>().notifyContacts(name);
      },
      child: Container(
        width: MediaQuery.of(context).size.width / 1.5,
        height: 200,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: Colors.red, borderRadius: BorderRadius.circular(5)),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Urgenty notify contacts',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            Text(
              'Auto call and message',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w400,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
