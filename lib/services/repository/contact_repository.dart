import 'package:messenger_app/models/contact.dart';
import '../provider/firebase_provider.dart';

class ContactRepository {
  FirebaseProvider _firebaseProvider = FirebaseProvider();

  Future<List<Contact>> getContactList() => _firebaseProvider.getDataFromFirebase();

}