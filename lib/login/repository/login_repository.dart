import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:prega_diet/common/firebase_constats.dart';
import 'package:prega_diet/common/model/user_details.dart';

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
  }) async {
    final userCredential = await auth.createUserWithEmailAndPassword(
        email: email, password: password);

    await firestore.collection(CPath.users).doc(email).set({
      'firstName': firstName,
      'lastName': lastName,
    });
    return UserDetails(firstName: firstName, lastName: lastName);
  }

  Future<void> signOut() async {
    await auth.signOut();
  }
}
