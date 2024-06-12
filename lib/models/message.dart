import 'package:cloud_firestore/cloud_firestore.dart';

class Message {
  // final String id;
  final String senderId;
  final String text;
  final String receiverId;
  final DateTime timestamp;

  Message({
    // required this.id,
    required this.senderId,
    required this.text,
    required this.receiverId,
    required this.timestamp,
  });

  factory Message.fromDocument(DocumentSnapshot doc) {
    return Message(
      // id: doc.id,
      senderId: doc['senderId'],
      text: doc['text'],
      receiverId: doc['receiverId'],
      timestamp: doc['timestamp'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'senderId': senderId,
      'text': text,
      'receiverId': receiverId,
      'timestamp': timestamp,
    };
  }
}
