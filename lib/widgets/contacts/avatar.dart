import 'dart:math';

import 'package:flutter/material.dart';

class NameAvatar extends StatelessWidget {
  final String? fullName;

  NameAvatar({this.fullName});

  @override
  Widget build(BuildContext context) {
    String? initials = _getInitials(fullName);
    Color color = _getColor(fullName);

    return CircleAvatar(
      backgroundColor: color,
      child: Text(
        initials!,
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  String? _getInitials(String? fullName) {
    if (fullName == null || fullName.isEmpty) return null;
    List<String> nameParts = fullName.split(' ');
    String initials = '';
    for (var part in nameParts) {
      if (part.isNotEmpty) {
        initials += part[0].toUpperCase();
      }
    }
    return initials;
  }

  Color _getColor(String? fullName) {
    if (fullName == null) return Colors.grey;
    final random = Random(fullName.hashCode);
    return Color.fromARGB(
      255,
      random.nextInt(256),
      random.nextInt(256),
      random.nextInt(256),
    );
  }
}
