import 'dart:convert';

class Item {
  final int id;
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
  factory Item.fromMap(Map<String, dynamic> map) {
    return Item(
      id: map['id']?.toInt() ?? 0,
      name: map['name'] ?? '',
      price: map['price']?.toDouble() ?? 0.0,
    );
  }

  String toJson() => json.encode(toMap());
  factory Item.fromJson(String source) => Item.fromMap(json.decode(source));
}
