import 'package:flutter/material.dart';
import 'package:untitled1/core/http_remote/http_remote.dart';
import 'package:untitled1/core/http_remote/http_remote.dart';

class MyDropdown extends StatefulWidget {
  final void Function(int id) onchanged;
  final List<Map<String, dynamic>> items;
  final String valueKey;
  final String textKey;

  const MyDropdown({
    super.key,
    required this.onchanged,
    required this.items,
    required this.valueKey,
    required this.textKey,
  });

  @override
  _MyDropdownState createState() => _MyDropdownState();
}

class _MyDropdownState extends State<MyDropdown> {
  String? selectedCategory;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      value: selectedCategory,
      onChanged: (newValue) {
        setState(() {
          selectedCategory = newValue;
          int id = int.tryParse(newValue ?? '') ?? -1;
          widget.onchanged(id);
        });
      },
      items: widget.items.map<DropdownMenuItem<String>>((value) {
        return DropdownMenuItem<String>(
          value: value[widget.valueKey].toString(),
          child: Text(value[widget.textKey]),
        );
      }).toList(),
    );
  }
}
