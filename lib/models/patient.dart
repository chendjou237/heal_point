import 'dart:convert';

class Patient {
  final String id;
  final String phoneNumber;
  final String password;
  final String names;
  Patient({
    required this.id,
    required this.phoneNumber,
    required this.password,
    required this.names,
  });

  Patient copyWith({
    String? id,
    String? phoneNumber,
    String? password,
    String? names,
  }) {
    return Patient(
      id: id ?? this.id,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      password: password ?? this.password,
      names: names ?? this.names,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'phoneNumber': phoneNumber,
      'password': password,
      'names': names,
    };
  }

  factory Patient.fromMap(Map<String, dynamic>? map) {
    return Patient(
      id: map?['id'] ?? '',
      phoneNumber: map?['phoneNumber'] ?? '',
      password: map?['password'] ?? '',
      names: map?['names'] ?? '',
    );
  }
  factory Patient.initial() {
    return Patient(
      id: '',
      phoneNumber: '',
      password: '',
      names: '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Patient.fromJson(String source) =>
      Patient.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Patient(id: $id, phoneNumber: $phoneNumber, password: $password, names: $names)';
  }
}
