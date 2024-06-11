import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';



class MyMessages {

  void loginSuccess (BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return CupertinoAlertDialog(
          title: Text('Вход успешен!'),
          content: Text('Добро пожаловать обратно'),
          actions: <Widget>[
            CupertinoDialogAction(
              child: Text('OK'),
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/contactlist');
              },
            ),
          ],
        );
      },
    );
  }



  void registerSuccess (BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return CupertinoAlertDialog(
          title: Text('Регистрация успешна!'),
          content: Text('Добро пожаловать!'),
          actions: <Widget>[
            CupertinoDialogAction(
              child: Text('OK'),
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/contactlist');
              },
            ),
          ],
        );
      },
    );
  }
  void registerOrLoginError (BuildContext context, e) {
    String errorMessage;

    if (e.message.contains(']')) {
      errorMessage = e.message.split('] ')[1];
    } else {
      errorMessage = e.message;
    }
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return CupertinoAlertDialog(
          title: Text('Что-то пошло не так!'),
          content: Text('$errorMessage'),
          actions: <Widget>[
            CupertinoDialogAction(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

}