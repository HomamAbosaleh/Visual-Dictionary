import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseImage {
  String path;
  String type;
  String description;
  DateTime date;
  String userId;

  FirebaseImage({
    required this.path,
    required this.type,
    required this.description,
    required this.date,
    required this.userId,
  });

  Map<String, dynamic> toJson() {
    return {
      'path': path,
      'type': type,
      'date': date,
      'description': description,
      'userId': userId
    };
  }

  factory FirebaseImage.fromJson(Map<String, dynamic> map) {
    return FirebaseImage(
      path: map['path'] ?? '',
      type: map['type'] ?? '',
      description: map['description'] ?? '',
      date: map['date'] is Timestamp ? (map['date'] as Timestamp).toDate() : DateTime.now(),
      userId: map['userId'],
    );
  }
}
