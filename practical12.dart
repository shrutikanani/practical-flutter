import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Lab12 extends StatelessWidget {
  const Lab12({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Nationalize App',
      debugShowCheckedModeBanner: false,
      home: NationalizeScreen(),
    );
  }
}

class NationalizeScreen extends StatefulWidget {
  @override
  _NationalizeScreenState createState() => _NationalizeScreenState();
}

class _NationalizeScreenState extends State<NationalizeScreen> {
  final TextEditingController _nameController = TextEditingController();
  List<Country> _countries = [];
  bool _isLoading = false;

  Future<void> _fetchNationality(String name) async {
    setState(() {
      _isLoading = true;
      _countries = [];
    });

    try {
      final response =
          await http.get(Uri.parse('https://api.nationalize.io/?name=$name'));

      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        final List<dynamic> countryList = jsonData['country'];

        setState(() {
          _countries = countryList.map((c) => Country.fromJson(c)).toList();
          _isLoading = false;
        });
      } else {
        throw Exception('Failed to fetch nationality');
      }
    } catch (e) {
      print('Error: $e');
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Nationalize App'),
        backgroundColor: Colors.indigo,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _nameController,
              decoration: InputDecoration(
                labelText: 'Enter a name',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                final name = _nameController.text.trim();
                if (name.isNotEmpty) {
                  _fetchNationality(name);
                }
              },
              child: Text('Get Nationality'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.indigo,
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              ),
            ),
            SizedBox(height: 20),
            _isLoading
                ? CircularProgressIndicator()
                : Expanded(
                    child: _countries.isEmpty
                        ? Text('No data available')
                        : ListView.builder(
                            itemCount: _countries.length,
                            itemBuilder: (context, index) {
                              final country = _countries[index];
                              return Card(
                                elevation: 2,
                                margin: EdgeInsets.symmetric(vertical: 6),
                                child: ListTile(
                                  leading: Icon(Icons.flag),
                                  title: Text(
                                    'Country: ${country.countryId}',
                                    style: TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  subtitle: Text(
                                    'Probability: ${(country.probability * 100).toStringAsFixed(2)}%',
                                  ),
                                ),
                              );
                            },
                          ),
                  ),
          ],
        ),
      ),
    );
  }
}

class Country {
  final String countryId;
  final double probability;

  Country({required this.countryId, required this.probability});

  factory Country.fromJson(Map<String, dynamic> json) {
    return Country(
      countryId: json['country_id'],
      probability: json['probability'],
    );
  }
}
