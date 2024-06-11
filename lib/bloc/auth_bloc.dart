import 'package:flutter/cupertino.dart';

import '../services/auth_service.dart';
import '../widgets/messages.dart';

class AuthBloc {
  final AuthService _authService = AuthService();

  void register(BuildContext context, String email, String username, String password) async {
    try {
      await _authService.register(email, username, password);
      MyMessages().registerSuccess(context);
      print('Registration successful');
    } catch (e) {
      MyMessages().registerOrLoginError(context, e);
      print('Registration failed: $e');
    }
  }
}