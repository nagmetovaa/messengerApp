import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';



class MyMessages {

  void loginSuccess (BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return CupertinoAlertDialog(
          title: Text('Log in success!'),
          content: Text('Welcome back'),
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
          title: Text('Successfully registered!'),
          content: Text('Welcome to Book tracker application!'),
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
          title: Text('Something gets wrong!'),
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