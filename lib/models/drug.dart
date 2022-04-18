import 'dart:convert';

class Drug {
  final String id;
  final String name;
  final String quantity;
  final String? image;
  final String price;
  final String details;
  Drug({
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
    };
  }

  factory Drug.fromMap(Map<String, dynamic> map) {
    return Drug(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      quantity: map['quantity'] ?? '',
      image: map['image'],
      price: map['price'] ?? '',
      details: map['details'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Drug.fromJson(String source) => Drug.fromMap(json.decode(source));
}
