import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:untitled1/features/drop.dart';
import 'package:untitled1/features/login/login_page.dart';
import 'package:untitled1/features/medicen/medicen.dart';

import '../../core/app_text-form_filed.dart';
import '../../core/http_remote/http_remote.dart';

class AddMedicine extends StatefulWidget {
  AddMedicine({super.key});

  @override
  State<AddMedicine> createState() => _AddMedicineState();
}

class _AddMedicineState extends State<AddMedicine> {
  final TextEditingController scientificName = TextEditingController();

  final TextEditingController tradeName = TextEditingController();

  final TextEditingController category = TextEditingController();

  final TextEditingController manufactureCompany = TextEditingController();

  final TextEditingController quantity = TextEditingController();

  final TextEditingController date = TextEditingController();

  final TextEditingController price = TextEditingController();

  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text('Add Medicine'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              // crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextFiledApp(
                  controller: scientificName,
                  type: TextInputType.name,
                  label: 'Scientific Name',
                  obscurePassword: false,
                  validate: (String value) {
                    if (value.isEmpty) {
                      return 'Scientific name must be not empty';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFiledApp(
                  controller: tradeName,
                  type: TextInputType.name,
                  label: 'Trade Name',
                  obscurePassword: false,
                  validate: (String value) {
                    if (value.isEmpty) {
                      return 'trade name must be not empty';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFiledApp(
                  controller: manufactureCompany,
                  type: TextInputType.name,
                  label: 'Manufacture Company',
                  obscurePassword: false,
                  validate: (String value) {
                    if (value.isEmpty) {
                      return 'manufacture company must be not empty';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                TextFiledApp(
                  controller: quantity,
                  type: TextInputType.name,
                  label: 'Quantity',
                  obscurePassword: false,
                  validate: (String value) {
                    if (value.isEmpty) {
                      return 'quantity must be not empty';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFiledApp(
                  onTap: () {
                    showDatePicker(
                            context: context,
                            firstDate: DateTime.now(),
                            lastDate: DateTime.parse('2024-04-03'))
                        .then((value) {
                      date.text = DateFormat.yMMMd().format(value!);
                    });
                  },
                  controller: date,
                  type: TextInputType.name,
                  label: 'Date',
                  obscurePassword: false,
                  validate: (String value) {
                    if (value.isEmpty) {
                      return 'date must be not empty';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFiledApp(
                  controller: price,
                  type: TextInputType.name,
                  label: 'Price',
                  obscurePassword: false,
                  validate: (String value) {
                    if (value.isEmpty) {
                      return 'price must be not empty';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                MyDropdown(),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: double.infinity,
                  height: 40,
                  child: MaterialButton(
                    onPressed: () async {
                      if (formKey.currentState!.validate()) {

                         // bool res =
                         //     await HttpRemote.addMedicine(
                         //        genericName:scientificName.text ,
                         //         brandName: tradeName.text,
                         //         quantity:quantity.text ,
                         //         expiryDate:date.text ,
                         //         price:price.text,
                         //         context: context);
                         // if (res) {
                           // ignore: use_build_context_synchronously
                           ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                             content: Text('add successful'),
                             backgroundColor: Colors.green,
                           ));
                        }
                      },

                    color: Colors.green,
                    child: const Text(
                      'Send',
                      style: TextStyle(fontSize: 17, color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
