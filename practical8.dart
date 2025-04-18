import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Languages List',
      debugShowCheckedModeBanner: false,
      home: LanguageListScreen(),
    );
  }
}

class LanguageListScreen extends StatelessWidget {
  final List<String> languages = [
    'C',
    'C++',
    'Java',
    'Python',
    'JavaScript',
    'Dart',
    'Kotlin',
    'Swift',
    'PHP',
    'Go',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Programming Languages'),
        backgroundColor: Colors.indigo,
        elevation: 4,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blue.shade50, Colors.purple.shade50],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        padding: EdgeInsets.all(12),
        child: ListView.separated(
          itemCount: languages.length,
          separatorBuilder: (context, index) => SizedBox(height: 10),
          itemBuilder: (context, index) {
            return Card(
              elevation: 3,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: ListTile(
                leading: Icon(Icons.code, color: Colors.indigo),
                title: Text(
                  languages[index],
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: Colors.indigo.shade900,
                  ),
                ),
                trailing: Icon(Icons.arrow_forward_ios, size: 16),
                contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                onTap: () {
                  // You can navigate to a detail screen or show info here
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
