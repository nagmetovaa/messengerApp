import 'package:firebase_auth/firebase_auth.dart';

class LoginService {

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<void> login (String email, String password) async {
    await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
  }
}