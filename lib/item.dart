import 'dart:convert';

class Item {
  final String id;
  final String name;
  final double price;

  Item({
    required this.id,
    required this.name,
    required this.price,
  });

  // toMap() Converts the Item object into a Map
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'price': price,
    };
  }

  // fromMap() Creates an Item object from a Map
  factory Item.fromMap(Map<String, dynamic> map, String id) {
    return Item(
      id: map['id']?.toString() ?? '',
      name: map['name'] ?? '',
      price: map['price']?.toDouble() ?? 0.0,
    );
  }

  String toJson() => json.encode(toMap());
  factory Item.fromJson(String source) {
    final map = json.decode(source) as Map<String, dynamic>;
    return Item.fromMap(map, map['id']?.toString() ?? '');
  }
}
