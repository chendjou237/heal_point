import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:heal_point/functions/functions.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final firebaseDbProvider = Provider<FirebaseFirestore>((ref) {
  return FirebaseFirestore.instance;
});

final databaseProvider = Provider<Database>((ref) => Database(ref.read));
