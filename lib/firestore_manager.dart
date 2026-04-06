import 'package:cloud_firestore/cloud_firestore.dart';
import 'item.dart';

class FirestoreManager {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  // Example collection reference
  final String collectionPath = "posts";

  CollectionReference get _collection => _db.collection(collectionPath);

  Future<void> addItem(Item item) async {
    try {
      await _collection.add(item.toMap());
    } catch (e) {
      throw Exception("Failed to add item: $e");
    }
  }
  
  Stream<List<Map<String, dynamic>>> streamItems() {
    return _collection.snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        return {
          "id": doc.id,
          ...doc.data() as Map<String, dynamic>,
        };
      }).toList();
    });
  }

  Future<void> updateItem(String id, Item item) async {
    try {
      await _collection.doc(id).update(item.toMap());
    } catch (e) {
      throw Exception("Failed to update item: $e");
    }
  }

  Future<void> deleteItem(String id) async {
    try {
      await _collection.doc(id).delete();
    } catch (e) {
      throw Exception("Failed to delete item: $e");
    }
  }
}

