import 'dart:convert';

class NurseOrder {
  final String name;
  final String date;
  final String time;
  final String  townQuarter;
  final String description;
  NurseOrder({
    required this.name,
    required this.date,
    required this.time,
    required this.townQuarter,
    required this.description,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'date': date,
      'time': time,
      'townQuarter': townQuarter,
      'description': description,
    };
  }


  factory NurseOrder.fromMap(Map<String, dynamic> map) {
    return NurseOrder(
      name: map['name'] ?? '',
      date: map['date'] ?? '',
      time: map['time'] ?? '',
      townQuarter: map['townQuarter'] ?? '',
      description: map['description'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory NurseOrder.fromJson(String source) => NurseOrder.fromMap(json.decode(source));
}
