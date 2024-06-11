// import 'dart:js';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/auth_bloc.dart';
import 'package:messenger_app/bloc/auth_bloc.dart';
import '../../bloc/login_bloc.dart';
import '../messages.dart';



class SignElements extends StatelessWidget{
  final String titleText;
  final bool signUp;
  final String buttonText;
  final bool loginPage;

  SignElements({Key? key, required this.titleText, required this.signUp, required this.buttonText, required this.loginPage});


  TextEditingController _emailController = TextEditingController();
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  final AuthBloc _authBloc = AuthBloc();
  final LoginBloc _loginBloc = LoginBloc();
  final ValueNotifier<bool> _obscureTextNotifier = ValueNotifier<bool>(true);


  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const Padding(padding: EdgeInsets.only(top: 10.0)),
        Text(
          titleText,
          style: const TextStyle(fontSize: 22, height: 3),
        ),
        const Padding(padding: EdgeInsets.only(top: 90.0)),
        SizedBox(
          width: 350,
          height: 45,
          child: CupertinoTextField(
            controller: _emailController,
            obscureText: false,
            placeholder: 'Введите email',
            decoration: BoxDecoration(
              border: Border.all(
                width: 1.0,
                color: CupertinoColors.systemGrey,
              ),
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
        ),
        const Padding(padding: EdgeInsets.only(top: 30.0)),
        if (signUp)
        SizedBox(
          width: 350,
          height: 45,
          child: CupertinoTextField(
            controller: _usernameController,
            obscureText: false,
            placeholder: 'Введите полное имя',
            decoration: BoxDecoration(
              border: Border.all(
                width: 1.0,
                color: CupertinoColors.systemGrey,
              ),
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
        ),
        if (signUp)
        const Padding(padding: EdgeInsets.only(top: 30.0)),
        SizedBox(
          width: 350,
          height: 45,
          child: ValueListenableBuilder<bool>(
            valueListenable: _obscureTextNotifier,
            builder: (context, obscureText, child) {
              return CupertinoTextField(
                controller: _passwordController,
                obscureText: obscureText,
                placeholder: 'Введите пароль',
                suffix: CupertinoButton(
                  padding: EdgeInsets.zero,
                  onPressed: () {
                    _obscureTextNotifier.value = !_obscureTextNotifier.value;
                  },
                  child: Icon(
                    obscureText ? CupertinoIcons.eye : CupertinoIcons.eye_slash,
                    size: 24,
                  ),
                ),
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 1.0,
                    color: CupertinoColors.systemGrey,
                  ),
                  borderRadius: BorderRadius.circular(8.0),
                ),
              );
            },
          ),
        ),
        const Padding(padding: EdgeInsets.only(bottom: 30.0)),
        SizedBox(
          width: 350,
          height: 50,
          child: CupertinoButton(
            onPressed: () {
              signUp ? _register(context) : _login(context);
            },
            child: Text(
              buttonText,
              style: const TextStyle(fontSize: 20),
            ),
            color: Colors.green,
          ),
        ),
        const Padding(padding: EdgeInsets.only(bottom: 30.0)),
        if (loginPage)
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Еще не зарегистрировались?',
                style: TextStyle(fontSize: 15)
              ),
              CupertinoButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, '/signup');
                },
                child: const Text(
                  'Зарегистрироваться',
                  style: TextStyle(fontSize: 15),
                  softWrap: false,
                ),
              ),
            ],
          ),
      ],
    );
  }

  void _register(BuildContext context) {
    final email = _emailController.text.trim();
    final password = _passwordController.text.trim();
    final username = _usernameController.text.trim();
    _authBloc.register(context,email, username, password);
  }

  void _login(BuildContext context) {
    final email = _emailController.text.trim();
    final password = _passwordController.text.trim();
    _loginBloc.login(context, email, password);
  }

}