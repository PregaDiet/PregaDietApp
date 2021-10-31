import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prega_diet/app_colors.dart';
import 'package:prega_diet/common/model/load_status.enum.dart';
import 'package:prega_diet/common/widgets/my_buttons.dart';
import 'package:prega_diet/contact/cubit/contact_cubit.dart';
import 'package:prega_diet/contact/screen/add_contact_screen.dart';

class EmergencyContactsWidget extends StatelessWidget {
  const EmergencyContactsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ContactCubit, ContactState>(
      listener: (context, state) {
        if (state.loadStatus == LoadStatus.error) {
          print('Failure: ${state.failure.exception}');
          print('Exception: ${state.failure.stackTrace}');
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text('Couldn\'t get contacts')));
        }
      },
      builder: (context, state) {
        if (state.loadStatus == LoadStatus.loaded ||
            state.loadStatus == LoadStatus.error) {
          final contacts = state.emergencyContacts;
          Widget _buildContactsList() {
            return Column(
              children: [
                Text(
                  'Your Emergency Contacts',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                    color: Colors.black45,
                  ),
                ),
                Column(
                  children: contacts.map((e) {
                    return Container(
                        margin: EdgeInsets.all(10),
                        padding: EdgeInsets.all(10),
                        width: MediaQuery.of(context).size.width / 1.5,
                        decoration: BoxDecoration(
                          color: AppColors.orange,
                        ),
                        alignment: Alignment.center,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Spacer(),
                            Text(
                              e,
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                              ),
                            ),
                            Spacer(),
                            IconButton(
                                onPressed: () {
                                  context.read<ContactCubit>().removeContact(e);
                                },
                                icon: Icon(Icons.remove))
                          ],
                        ));
                  }).toList(),
                ),
                if (contacts.length < 3)
                  MyButton(
                    onTap: () async {
                      final result = await Navigator.push<String?>(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AddContact()));

                      if (result != null) {
                        context.read<ContactCubit>().addContact(result);
                      }
                    },
                    color: AppColors.orange,
                    text: 'Add',
                  )
              ],
            );
          }

          if (contacts.isEmpty) {
            return Column(
              children: [
                Text(
                  'No Contacts Added',
                  style: TextStyle(color: Colors.black54, fontSize: 20),
                ),
                SizedBox(height: 5),
                if (contacts.length < 3)
                  MyButton(
                    onTap: () async {
                      final result = await Navigator.push<String?>(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AddContact()));
                      if (result != null) {
                        context.read<ContactCubit>().addContact(result);
                      }
                    },
                    color: AppColors.green,
                    text: 'Add',
                  )
              ],
            );
          } else {
            return _buildContactsList();
          }
        } else if (state.loadStatus == LoadStatus.loading) {
          return CircularProgressIndicator();
        } else {
          return Text('Initial');
        }
      },
    );
  }
}
