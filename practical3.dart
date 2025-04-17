#part 1
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Prac3"),
        ),
        body: Center(
          child: Text(
            "Shruti Kanani",
            style: TextStyle(
              color: Colors.purpleAccent,
              fontSize: 78,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    ),
  );
}

#part 2
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Practical3'),
        ),
        body: Container(
          width: 300.0,
          height: 500.0,
          margin: EdgeInsets.all(15.0),
          padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
          decoration: BoxDecoration(
            color: Colors.brown, // Background color of the container
            border: Border.all(
              color: Colors.black, // Border color
              width: 10.0, // Border width
            ),
            borderRadius: BorderRadius.circular(20.0), // Rounded corners
          ),
          alignment: Alignment.center,
          child: Text(
            'SHRUTI KANANI',
            style: TextStyle(
              color: Colors.amber,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    ),
  );
}

