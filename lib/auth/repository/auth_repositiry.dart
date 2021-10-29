import 'package:firebase_auth/firebase_auth.dart';

class AuthRepository {
  AuthRepository({required this.auth});

  final FirebaseAuth auth;

  // Future<UserCredential> signIn(
  //     {required String email, required String password}) async {
  //   final userCredential = await auth.signInWithEmailAndPassword(
  //       email: email, password: password);
  //   return userCredential;
  // }

  // Future<void> signOut() async {
  //   await auth.signOut();
  // }

  Stream<User?> get userChanges => auth.userChanges();

  // Future<bool> isSignedIn() async {
  //   final currentUser = auth.currentUser;
  //   return currentUser != null;
  // }

  // Future<String> getUser() async {
  //   return auth.currentUser!.email!;
  // }
}
