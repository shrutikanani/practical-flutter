import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Subjects List App',
      debugShowCheckedModeBanner: false,
      home: SubjectScreen(),
    );
  }
}

class SubjectScreen extends StatelessWidget {
  final List<String> subjects = [
    'Mathematics',
    'Chemistry',
    'Computer Science',
    'English',
    'Geography',
    'Economics',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Subjects List'),
        backgroundColor: Colors.indigo,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blue.shade100, Colors.purple.shade100],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        padding: EdgeInsets.all(16),
        child: ListView.builder(
          itemCount: subjects.length,
          itemBuilder: (context, index) {
            return Card(
              elevation: 4,
              margin: EdgeInsets.symmetric(vertical: 8),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: ListTile(
                contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                title: Text(
                  subjects[index],
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: Colors.indigo.shade900,
                  ),
                ),
                trailing: Icon(Icons.arrow_forward_ios, size: 16),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          DetailScreen(itemName: subjects[index]),
                    ),
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}

class DetailScreen extends StatelessWidget {
  final String itemName;

  DetailScreen({required this.itemName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange.shade50,
      appBar: AppBar(
        title: Text('Subject Detail'),
        backgroundColor: Colors.indigo,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.book, color: Colors.deepOrange, size: 60),
            SizedBox(height: 20),
            Text(
              itemName,
              style: TextStyle(
                fontSize: 30,
                color: Colors.brown.shade700,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 30),
            ElevatedButton.icon(
              icon: Icon(Icons.arrow_back),
              label: Text('Back to List'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.indigo,
                foregroundColor: Colors.white,
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
