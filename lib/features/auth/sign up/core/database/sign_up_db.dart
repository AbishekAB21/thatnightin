import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:thatnightin/common/providers/theme_provider.dart';
import 'package:thatnightin/common/widgets/reusable_snackbar.dart';

class SignUpDb {
  final _auth = FirebaseAuth.instance;
  final _firestore = FirebaseFirestore.instance;

  void createUserEmailPassword(
    String username,
    String email,
    String password,
    BuildContext context,
    WidgetRef ref,
  ) async {
    final color = ref.watch(themeProvider);
    try {
      // Create account
      final UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);

      // Get Uid
      String uid = userCredential.user!.uid;

      // Save User details
      await _firestore.collection('users').doc(uid).set({
        'uid': uid,
        'username': username,
        'email': email,
        'createdAt': FieldValue.serverTimestamp(),
      });

      // Sign out immediatly so User has to log in manually
      await FirebaseAuth.instance.signOut();

      if (context.mounted) {
        ShowCustomSnackbar().showSnackbar(
          context,
          'Account Created - Please Sign in',
          color.successColor,
          ref,
        );
      }
    } catch (e) {
      if (context.mounted) {
        ShowCustomSnackbar().showSnackbar(
          context,
          'Error creating account $e',
          color.errorColor,
          ref,
        );
      }
    }
  }
}
