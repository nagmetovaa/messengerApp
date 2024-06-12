
import 'dart:ffi';

class Contact{
  String id;
  String username;
  String email;
  String lastmessage;
  DateTime time;

  Contact({ required this.id,
    required this.username,
    required this.email,
    this.lastmessage = '',
    required this.time ,
  });

  factory Contact.fromJson(Map<String, dynamic> json) {
    return Contact(
        id: json['id'],
        username: json['username'],
        email: json['email'],
        lastmessage: json['message'],
        time: json['time']
    );
  }
}