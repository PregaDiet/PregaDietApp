import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../common/firebase_constats.dart';
import '../../common/model/user_details.dart';

class LoginRepository {
  LoginRepository({required this.auth, required this.firestore});

  final FirebaseAuth auth;
  final FirebaseFirestore firestore;

  Future<UserDetails> signIn(
      {required String email, required String password}) async {
    final snapshot = await firestore.collection(CPath.users).doc(email).get();

    final userDetails = UserDetails.fromMap(snapshot.data()!);
    final userCredential =
        await auth.signInWithEmailAndPassword(email: email, password: password);
    return userDetails;
  }

  Future<UserDetails> signUp({
    required String email,
    required String password,
    required String firstName,
    required String lastName,
    required String city,
  }) async {
    final userCredential = await auth.createUserWithEmailAndPassword(
        email: email, password: password);

    await firestore.collection(CPath.users).doc(email).set({
      'firstName': firstName,
      'lastName': lastName,
      'city': city,
    });
    return UserDetails(
      firstName: firstName,
      lastName: lastName,
      city: city,
    );
  }

  Future<UserDetails> getUserDetails() async {
    final snapshot = await firestore
        .collection(CPath.users)
        .doc(FirebaseAuth.instance.currentUser!.email)
        .get();

    final data = snapshot.data()!;

    final String firstName = data['firstName'] as String;
    final String lastName = data['lastName'] as String;
    final String city = data['city'] as String;

    final UserDetails userDetails = UserDetails(
      firstName: firstName,
      lastName: lastName,
      city: city,
    );

    return userDetails;
  }

  Future<void> signOut() async {
    await auth.signOut();
  }
}
