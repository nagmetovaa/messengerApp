import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:messenger_app/pages/sign_in.dart';
import 'package:messenger_app/pages/sign_up.dart';
import 'package:messenger_app/pages/contact_list.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:messenger_app/services/repository/chat_repository.dart';
import 'bloc/message_bloc/message_bloc.dart';
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

  ChatRepository chatRepository = ChatRepository();
  bool _isLoggedIn = false;

  @override
  void initState() {
    super.initState();
    _checkLoginStatus();
  }

  void _checkLoginStatus() async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user == null) {
    setState(() {
      _isLoggedIn = false;
    });
    }else {
      setState(() {
        _isLoggedIn = true;
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<MessageBloc>(
          create: (context) => MessageBloc(chatRepository),
        ),
      ],
      child: MaterialApp(
        title: 'Messenger Application',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
          useMaterial3: true,
        ),
        home: _isLoggedIn ? ContactList() : SignIn(onRegistrationComplete: _onRegistrationComplete),
        routes: {
          '/contactlist': (context) => ContactList(),
          '/signup': (context) => SignUp(),
        },
      ),
    );
  }


  void _onRegistrationComplete() {
    setState(() {
      _isLoggedIn = true;
    });
  }

}
