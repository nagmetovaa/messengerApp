// import 'package:bookTracker/widgets/title.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../widgets/sign/sign_elements.dart';

class SignIn extends StatelessWidget {
  final VoidCallback onRegistrationComplete;

  const SignIn({Key? key, required this.onRegistrationComplete}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child:SignElements(titleText: 'Войти в существующий аккаунт',signUp: false, buttonText: 'Войти', loginPage: true,)
      ),
    );
  }
}
