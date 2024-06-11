import 'package:messenger_app/pages/sign_in.dart';
import 'package:messenger_app/pages/sign_up.dart';
import 'package:messenger_app/pages/contact_list.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';



void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform,);
  runApp(MyApp());
}

class MyApp extends StatefulWidget {

  const MyApp({super.key});
  _MyAppState createState() => _MyAppState();
}
class _MyAppState extends State<MyApp> {

  bool _isLoggedIn = false;

  @override
  void initState() {
    super.initState();
    _checkLoginStatus();
  }

  void _checkLoginStatus() async {

    // попозже сделаю как проверить логин

    setState(() {
      _isLoggedIn = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Messenger Application',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
      ),
      home: _isLoggedIn ? ContactList() : SignIn(onRegistrationComplete: _onRegistrationComplete),
      routes: {
        '/contactlist': (context) => ContactList(),
        '/signup': (context) => SignUp()
      },
    );
  }

  void _onRegistrationComplete() {
    setState(() {
      _isLoggedIn = true;
    });
  }

}
