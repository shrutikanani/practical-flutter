import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'User List App',
      debugShowCheckedModeBanner: false,
      home: UserList(),
    );
  }
}

class UserList extends StatefulWidget {
  @override
  _UserListState createState() => _UserListState();
}

class _UserListState extends State<UserList> {
  List users = [];

  @override
  void initState() {
    super.initState();
    fetchUsers();
  }

  void fetchUsers() async {
    final res = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));

    if (res.statusCode == 200) {
      setState(() {
        users = jsonDecode(res.body);
      });
    } else {
      // Optional: show error dialog/snackbar
      print("Failed to load users");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Users List'),
        backgroundColor: Colors.indigo,
      ),
      body: users.isEmpty
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: users.length,
              itemBuilder: (_, index) {
                return Card(
                  elevation: 2,
                  margin: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ListTile(
                    leading: CircleAvatar(
                      child: Text(users[index]['name'][0]),
                      backgroundColor: Colors.indigo.shade200,
                    ),
                    title: Text(users[index]['name']),
                    subtitle: Text(users[index]['email']),
                  ),
                );
              },
            ),
    );
  }
}
