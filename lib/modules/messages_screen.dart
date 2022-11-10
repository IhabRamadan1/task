import 'package:flutter/material.dart';

class MessageScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        "Message",
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 25,
        ),
      ),
    );
  }
}