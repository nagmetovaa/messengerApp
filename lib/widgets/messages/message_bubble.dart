import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MessageBubble extends StatelessWidget {
  final String message;
  final bool isMe;

  MessageBubble({required this.message, required this.isMe});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Row(
          mainAxisAlignment:
          isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.symmetric(vertical: 4.0),
              padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
              decoration: BoxDecoration(
                color: isMe ? Colors.blue[100] : Colors.green[100],
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: Text(
                message,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 10.0,
                ),
              ),
            ),
          ],
        ),);
  }
}