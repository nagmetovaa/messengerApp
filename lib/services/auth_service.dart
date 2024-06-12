import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<void> register(String email, String username, String password) async {
    final UserCredential userCredential = await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);

    final User? user = userCredential.user;
    if (user != null) {
      String userId = user.uid;

      await FirebaseFirestore.instance.collection('user').doc(userId).set({
        'email': userCredential.user?.email,
        'username': username,
        'id': userCredential.user?.uid});
    }

  }
}