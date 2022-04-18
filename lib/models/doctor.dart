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
      'fee': fee,
    };
  }

  factory Doctor.fromMap(Map<String, dynamic> map) {
    return Doctor(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      email: map['email'] ?? '',
      phone: map['phone'] ?? '',
      address: map['address'] ?? '',
      image: map['image'] ?? '',
      specialization: map['specialization'] ?? '',
      experience: map['experience'] ?? '',
      fee: map['fee'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Doctor.fromJson(String source) => Doctor.fromMap(json.decode(source));
}
