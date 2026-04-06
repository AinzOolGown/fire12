import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreManager {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  // Example collection reference
  final String collectionPath = "posts";

  CollectionReference get _collection => _db.collection(collectionPath);
}