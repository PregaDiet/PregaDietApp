import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:prega_diet/common/firebase_constats.dart';

class ContactRepository {
  final FirebaseFirestore firestore;
  ContactRepository({
    required this.firestore,
  });

  Future<List<String>> getEmergencyContacts() async {
    List<String> emergencyContacts = [];

    final snapshot = await firestore
        .collection(CPath.users)
        .doc(FirebaseAuth.instance.currentUser!.email)
        .get();

    final List? data = snapshot.data()!['emergencyContacts'];

    if (data != null) {
      for (final contact in data) {
        emergencyContacts.add(contact);
      }
    }

    return emergencyContacts;
  }

  Future<void> notifyAllContacts() async {}

  Future<void> updateContacts(List<String> contacts) async {
    await firestore
        .collection(CPath.users)
        .doc(FirebaseAuth.instance.currentUser!.email)
        .set({'emergencyContacts': contacts}, SetOptions(merge: true));
  }
}
