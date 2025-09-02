import 'package:cloud_firestore/cloud_firestore.dart';

class DetailsDb {
  final _firebase = FirebaseFirestore.instance;

  // Fetch match details using matchID
  Stream<DocumentSnapshot<Map<String, dynamic>>> fetchMatchDetailsWithMatchId(
    String matchId,
  ) {
    return _firebase.collection('matches').doc(matchId).snapshots();
  }
}
