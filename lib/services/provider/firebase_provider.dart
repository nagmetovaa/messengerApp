import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../models/contact.dart';


class FirebaseProvider {

  Future<List<Contact>> getDataFromFirebase() async{

    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('user')
        .get();

    final List<Contact> contactLists = [];

    for (final doc in querySnapshot.docs) {
      Map<String, dynamic>? dataList = doc.data() as Map<String, dynamic>?;
      Contact contact = Contact(
          username: dataList?['username'],
          email: dataList?['email']
      );
      contactLists.add(contact);
    }
    return contactLists;

  }

}