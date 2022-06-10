import 'dart:convert';

class Patient {
  final String? id;
  final String? phoneNumber;
 
  final String names;
  final String email;
  Patient({
     this.id,
     this.phoneNumber,
    
    required this.names,
    required this.email,
  });

  Patient copyWith({
    String? id,
    String? phoneNumber,
    String? password,
    String? names,
    String? email,
  }) {
    return Patient(
      id: id ?? this.id,
      phoneNumber: phoneNumber ?? this.phoneNumber,
    
      names: names ?? this.names,
      email: email ?? this.email,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'phoneNumber': phoneNumber,
     
      'names': names,
      'email': email,
    };
  }

  factory Patient.fromMap(Map<String, dynamic>? map) {
    return Patient(
      
      phoneNumber: map?['phoneNumber'] ?? '',
     id: map?['id'] ?? '',
      names: map?['names'] ?? '',
      email: map?['email'] ?? '',
    );
  }
  factory Patient.initial() {
    return Patient(
      id: '',
      phoneNumber: '',
     
      email: '',
      names: '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Patient.fromJson(String source) =>
      Patient.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Patient(id: $id, phoneNumber: $phoneNumber, names: $names)';
  }


  
}
