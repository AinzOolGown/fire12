import 'package:cloud_firestore/cloud_firestore.dart';
import 'item.dart';

class FirestoreManager {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  // Example collection reference
  final String collectionPath = "posts";

  CollectionReference get _collection => _db.collection(collectionPath);

  Future<void> addItem(Map<String, dynamic> data) async {
    try {
      await _collection.add(data);
    } catch (e) {
      throw Exception("Failed to add item: $e");
    }
  }
}

