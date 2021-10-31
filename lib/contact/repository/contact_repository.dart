import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:prega_diet/common/firebase_constats.dart';
import 'package:http/http.dart' as http;
import 'package:prega_diet/common/get_location.dart';
import 'package:prega_diet/contact/model/aasha_contact.dart';

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

  Future<bool> _notify(
      String name, String phoneNumber, String lat, String long) async {
    Uri url = Uri.http(
        '172.104.206.215:8080', '/emergency/$name/$phoneNumber/$lat/$long');

    final response = await http.get(url);

    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  Future<void> notifyAll(String name, List<String> contacts) async {
    final location = await getLocation();
    final lat = location.latitude.toString();
    final long = location.longitude.toString();

    for (final c in contacts) {
      final notified = await _notify(name, c, lat, long);
    }
  }

  Future<void> updateContacts(List<String> contacts) async {
    await firestore
        .collection(CPath.users)
        .doc(FirebaseAuth.instance.currentUser!.email)
        .set({'emergencyContacts': contacts}, SetOptions(merge: true));
  }

  Future<AashaContact?> getAasha(String city) async {
    Uri url = Uri.http('172.104.206.215:8080', '/aasha/${city.toLowerCase()}');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = json.decode(response.body);

      final aasha = AashaContact.fromMap(data);

      return aasha;
    }
  }
}
