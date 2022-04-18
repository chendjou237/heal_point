import 'dart:convert';

class Hospital {
  final String id;
  final String name;
  final String address;
  final String phoneNumber;
  final String rating;
  final String image;
  final String description;
  Hospital({
    required this.id,
    required this.name,
    required this.address,
    required this.phoneNumber,
    required this.rating,
    required this.image,
    required this.description,
  });
  

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'address': address,
      'phoneNumber': phoneNumber,
      'rating': rating,
      'image': image,
      'description': description,
    };
  }

  factory Hospital.fromMap(Map<String, dynamic> map) {
    return Hospital(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      address: map['address'] ?? '',
      phoneNumber: map['phoneNumber'] ?? '',
      rating: map['rating'] ?? '',
      image: map['image'] ?? '',
      description: map['description'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Hospital.fromJson(String source) => Hospital.fromMap(json.decode(source));
}
