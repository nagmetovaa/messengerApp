import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../models/contact.dart';


class FirebaseProvider {

  Future<List<Contact>> getDataFromFirebase() async{

    User? user = FirebaseAuth.instance.currentUser;

    if (user == null) {
      throw Exception("No user is currently signed in.");
    }
    String userEmail = user.email!;
    String userId = user.uid;

    Map<String, dynamic> lastMessages = {};

    QuerySnapshot messageQuerySnapshot = await FirebaseFirestore.instance
        .collection('messages')
        .where('senderId', isEqualTo: userId)
        .orderBy('timestamp', descending: true)
        .get();

    for (var doc in messageQuerySnapshot.docs) {
      Map<String, dynamic> messageData = doc.data() as Map<String, dynamic>;
      String recipientId = messageData['receiverId'];
      if (!lastMessages.containsKey(recipientId)) {
        lastMessages[recipientId] = {
          'text': messageData['text'],
          'timestamp': (messageData['timestamp'] as Timestamp).toDate(),
        };
      }
    }

    List<Contact> contactLists = [];

    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('user')
        .where('email', isNotEqualTo: userEmail)
        .get();

    for (final doc in querySnapshot.docs) {
      Map<String, dynamic>? dataList = doc.data() as Map<String, dynamic>?;

      String Id = dataList?['id'] ?? '';

      Contact contact = Contact(
        id: doc.id,
        username: dataList?['username'] ?? '',
        email: dataList?['email'] ?? '',
        lastmessage: lastMessages[Id]?['text'] ?? '',
        time: lastMessages[Id]?['timestamp'] ?? '',
      );

      contactLists.add(contact);
    }

    return contactLists;
  }

}
