import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:messenger_app/models/message.dart';

class MessageService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  User? user = FirebaseAuth.instance.currentUser;

  Future<void> sendMessage(String receiverId, String text) async {
    await _firestore.collection('messages').add({
      'senderId': user?.uid,
      'receiverId': receiverId,
      'text': text,
      'timestamp': Timestamp.fromDate(DateTime.now()),
    });
  }

  Future<List<Message>> getMessages(String contactId) async {
    QuerySnapshot sentMessagesQuery = await _firestore
        .collection('messages')
        .where('senderId', isEqualTo: user?.uid)
        .where('receiverId', isEqualTo: contactId)
        .orderBy('timestamp', descending: true)
        .get();

    QuerySnapshot receivedMessagesQuery = await _firestore
        .collection('messages')
        .where('receiverId', isEqualTo: user?.uid)
        .where('senderId', isEqualTo: contactId)
        .orderBy('timestamp', descending: true)
        .get();

    List<QueryDocumentSnapshot> allDocs = [
      ...sentMessagesQuery.docs,
      ...receivedMessagesQuery.docs,
    ];

    allDocs.sort((a, b) {
      Timestamp timestampA = a['timestamp'] as Timestamp;
      Timestamp timestampB = b['timestamp'] as Timestamp;
      return timestampB.compareTo(timestampA);
    });

    List<Message> messages = allDocs.map((doc) {
      return Message(
        senderId: doc['senderId'],
        receiverId: doc['receiverId'],
        text: doc['text'],
        timestamp: (doc['timestamp'] as Timestamp).toDate(),
      );
    }).toList();

    return messages;
  }
  }
