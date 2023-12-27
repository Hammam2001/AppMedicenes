import 'package:flutter/material.dart';
import 'package:untitled1/core/http_remote/http_remote.dart';

class MyDropdown extends StatefulWidget {
  @override
  _MyDropdownState createState() => _MyDropdownState();
}

class _MyDropdownState extends State<MyDropdown> {
  String ? selectedCategory;

  List<String> categori = [
    'Analgesics',
    'Antipyretics',
    'Vaccines ',
    'Cardiovascular Medications',
    'Hormones',
    'Antiseptics',
    'Psychotropic Medications',
    'Muscle Relaxants',
  ];
  List<Map<String, dynamic>> categories = [];

  @override
  Widget build(BuildContext context) {
    return DropdownButton<Map<String, dynamic>>(
      value: categories.isNotEmpty ? categories[0] : null,
      onChanged: (value) {
        setState(() {
          // Handle the selected category
        });
      },
      items: categories.map<DropdownMenuItem<Map<String, dynamic>>>((category) {
        return DropdownMenuItem<Map<String, dynamic>>(
          value: category,
          child: Text(category['name']),
        );
      }).toList(),
    );
  }
}