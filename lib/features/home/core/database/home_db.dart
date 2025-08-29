import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

import 'package:thatnightin/features/home/component/home_screen_component.dart';

/// Handles read & write firebase methods for [HomeScreenComponent]

class HomeDb {
  // Firebase
  final _firebase = FirebaseFirestore.instance;

  // Save match details - (If not already present)
  Future<void> saveMatchDetails(
    String matchId,
    Map<String, dynamic> matchData,
  ) async {
    final matchRef = _firebase.collection('matches').doc(matchId);

    await matchRef.set(matchData, SetOptions(merge: true));
  }

  // Save data to firebase - (User's Private and Public collection)
  Future<void> savePostToDatabase({
    required String matchId,
    required String caption,
    required String uid,
    required String? imageUrl,
  }) async {
    final postsRef = _firebase.collection('posts').doc();
    final postId = postsRef.id;

    final postData = {
      "matchId": matchId,
      "postId": postId,
      "uid": uid,
      "caption": caption,
      "imageUrl": imageUrl,
      "cereatedAt": FieldValue.serverTimestamp(),
    };

    // Saving to public collection
    await postsRef.set(postData);

    // Saving to user's private collection
    await _firebase
        .collection('users')
        .doc(uid)
        .collection('myposts')
        .doc(postId)
        .set(postData);
  }

  // Upload Image to Firebase Storage
  Future<String?> uploadImageToStorage(XFile img) async {
    try {
      final storageRef = FirebaseStorage.instance.ref().child(
        'posts/${DateTime.now().millisecondsSinceEpoch}.jpg',
      );

      await storageRef.putFile(File(img.path));

      final url = await storageRef.getDownloadURL();

      return url;
    } catch (e) {
      return null;
    }
  }
}
