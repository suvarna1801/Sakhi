import 'package:cloud_firestore/cloud_firestore.dart';

void logAppOpen() async {
  await FirebaseFirestore.instance.collection('app_logs').add({
    'event': 'app_opened',
    'timestamp': FieldValue.serverTimestamp(),
    'user_id': FirebaseAuth.instance.currentUser?.uid ?? 'guest'
  });
}
