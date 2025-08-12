import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignInDb {
  final _firestore = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;

  void signInUserWithEmailAndPassword(String email, String password) async {
    await _auth.signInWithEmailAndPassword(email: email, password: password);
  }
}
