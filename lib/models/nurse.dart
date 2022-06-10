import 'dart:convert';

class Nurse {
  final String name;
  final String email;
  Nurse({
    required this.name,
    required this.email,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
    };
  }

  factory Nurse.fromMap(Map<String, dynamic> map) {
    return Nurse(
      name: map['name'] ?? '',
      email: map['email'] ?? '',
    );
  }
  factory Nurse.initial() {
    return Nurse(
      name: '',
      email: '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Nurse.fromJson(String source) => Nurse.fromMap(json.decode(source));
}
