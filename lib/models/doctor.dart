import 'dart:convert';

class Doctor {
  final String id;
  final String name;
  final String email;
  final String phone;
  final String address;
  final String image;
  final String specialization;
  final String experience;
  final String rating;
  final String fee;
  Doctor({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.address,
    required this.image,
    required this.specialization,
    required this.experience,
    required this.rating,
    required this.fee,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'phone': phone,
      'address': address,
      'image': image,
      'specialization': specialization,
      'experience': experience,
      'rating': rating,
      'fee': fee,
    };
  }

  factory Doctor.fromMap(Map<String, dynamic>? map) {
    return Doctor(
      id: map?['id'] ?? '',
      name: map?['name'] ?? '',
      email: map?['email'] ?? '',
      phone: map?['phone'] ?? '',
      address: map?['address'] ?? '',
      image: map?['image'] ?? '',
      specialization: map?['specialization'] ?? '',
      experience: map?['experience'] ?? '',
      rating: map?['rating'] ?? '',
      fee: map?['fee'] ?? '',
    );
  }

  factory Doctor.initial() {
    return Doctor(
      id: '',
      name: '',
      email: '',
      phone: '',
      address: '',
      image: '',
      specialization: '',
      experience: '',
      rating: '',
      fee: '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Doctor.fromJson(String source) => Doctor.fromMap(json.decode(source));

  Doctor copyWith({
    String? id,
    String? name,
    String? email,
    String? phone,
    String? address,
    String? image,
    String? specialization,
    String? experience,
    String? rating,
    String? fee,
  }) {
    return Doctor(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      address: address ?? this.address,
      image: image ?? this.image,
      specialization: specialization ?? this.specialization,
      experience: experience ?? this.experience,
      rating: rating ?? this.rating,
      fee: fee ?? this.fee,
    );
  }
}
