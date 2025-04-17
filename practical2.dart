import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: Text(
            "Hello Shruti",
            style: TextStyle(color: Colors.pink, fontSize: 24),
          ),
        ),
      ),
    ),
  );
}
