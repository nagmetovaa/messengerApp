import 'package:messenger_app/services/login_service.dart';
import 'package:flutter/cupertino.dart';
import '../widgets/messages.dart';

class LoginBloc {
  final LoginService _loginService = LoginService();

  void login (BuildContext context, String email, String password) async {
    try {
      await _loginService.login(email, password);
      MyMessages().loginSuccess(context);
      print('Sign in successfuly');
    } catch (e) {
      MyMessages().registerOrLoginError(context, e);
      print('Sign in failed: $e');
    }
  }
}