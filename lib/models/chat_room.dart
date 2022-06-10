import 'dart:convert';

class ChatRoom {
  final String lastMessage;
  final String status;
  final String patientId;
  final String patientNames;
  final String time;
  final String patientEmail;
  ChatRoom({
    required this.lastMessage,
    required this.status,
    required this.patientId,
    required this.patientNames,
    required this.time,
    required this.patientEmail,
  });

  Map<String, dynamic> toMap() {
    return {
      'lastMessage': lastMessage,
      'status': status,
      'patientId': patientId,
      'patientNames': patientNames,
      'time': time,
      'patientEmail': patientEmail,
    };
  }

  factory ChatRoom.fromMap(Map<String, dynamic>? map) {
    return ChatRoom(
      lastMessage: map?['last_message'] ?? '',
      status: map?['status'] ?? '',
      patientId: map?['patient_id'] ?? '',
      patientEmail: map?['patient_email'] ?? '',
      patientNames: map?['patient_names'] ?? '',
      time: map?['time'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory ChatRoom.fromJson(String source) =>
      ChatRoom.fromMap(json.decode(source));

  ChatRoom copyWith({
    String? lastMessage,
    String? status,
    String? patientId,
    String? patientNames,
    String? patientEmail,
    String? time,
  }) {
    return ChatRoom(
      lastMessage: lastMessage ?? this.lastMessage,
      status: status ?? this.status,
      patientId: patientId ?? this.patientId,
      patientNames: patientNames ?? this.patientNames,
      patientEmail: patientEmail ?? this.patientEmail,
      time: time ?? this.time,
    );
  }
}
