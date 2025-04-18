#part1
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Row Example'),
        ),
        body: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisSize: MainAxisSize.max,
          textDirection: TextDirection.ltr,
          children: <Widget>[
            Text(
              'shruti',
              style: TextStyle(color: Colors.black, fontSize: 25),
            ),
            Text(
              'kanani',
              style: TextStyle(color: Colors.pink, fontSize: 25),
            ),
            Text(
              'jambuda',
              style: TextStyle(color: Colors.blueAccent, fontSize: 25),
            ),
          ],
        ),
      ),
    ),
  );
}
#part2
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'RichText Example',
            style: TextStyle(fontSize: 60, backgroundColor: Colors.amber),
          ),
        ),
        body: Center(
          child: RichText(
            text: const TextSpan(
              text: 'My Bonnie',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.underline,
                color: Colors.green,
                fontSize: 50,
              ),
              children: [
                TextSpan(
                  text:
                      ' lies over the ocean. My Bonnie lies over the sea. My Bonnie lies over the ocean. Oh, bring back my Bonnie to me.',
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 20,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ),
  );
}

