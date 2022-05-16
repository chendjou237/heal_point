import 'dart:convert';

class Drug {
  final String id;
  final String name;
  final int quantity;
  final String? image;
  final double price;
  final String details;
  final String type;
  final String category;
  Drug( {
   required this.type, required this.category, 
    required this.id,
    required this.name,
    required this.quantity,
    this.image,
    required this.price,
    required this.details,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'quantity': quantity,
      'image': image,
      'price': price,
      'details': details,
      'type': type,
      'category': category,
    };
  }

  factory Drug.fromMap(Map<String, dynamic> map) {
    return Drug(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      quantity: map['quantity'] ?? 0,
      image: map['image'],
      price: map['price'] ?? 0.0,
      details: map['details'] ?? '',
      type: map['type'] ?? '',
      category: map['category'] ??'',
    );
  }

  String toJson() => json.encode(toMap());

  factory Drug.fromJson(String source) => Drug.fromMap(json.decode(source));
}
