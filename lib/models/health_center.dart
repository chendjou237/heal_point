import 'dart:convert';

class HealthCenter {
  final String id;
  final String name;
  final String address;
  final String phoneNumber;
  final double rating;
  final String image;
  final String description;
  HealthCenter({
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

  factory HealthCenter.fromMap(Map<String, dynamic> map) {
    return HealthCenter(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      address: map['address'] ?? '',
      phoneNumber: map['phoneNumber'] ?? '',
      rating: map['rating'] ?? 0.0,
      image: map['image'] ?? '',
      description: map['description'] ?? '',
    );
  }
  factory HealthCenter.initial() {
    return HealthCenter(
      id: '',
      name: '',
      address: '',
      image: '',
      phoneNumber: '',
      rating: 0.0,
      description: '',
    );
  }
  String toJson() => json.encode(toMap());

  factory HealthCenter.fromJson(String source) =>
      HealthCenter.fromMap(json.decode(source));
}
