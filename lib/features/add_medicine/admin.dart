import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:untitled1/core/drop_down/drop.dart';
import 'package:untitled1/features/langouge/langouge.dart';
import 'package:untitled1/features/medicen/medicen.dart';

import '../../core/app_text_form/app_text-form_filed.dart';
import '../../core/http_remote/http_remote.dart';
import '../drawer.dart';
import '../orders/view_order.dart';

class AddMedicine extends StatefulWidget {
  AddMedicine({super.key});

  @override
  State<AddMedicine> createState() => _AddMedicineState();
}

class _AddMedicineState extends State<AddMedicine> {
  final TextEditingController scientificName = TextEditingController();
  final TextEditingController companyController = TextEditingController();

  final TextEditingController tradeName = TextEditingController();

  final TextEditingController category = TextEditingController();


  final TextEditingController quantity = TextEditingController();

  final TextEditingController date = TextEditingController();

  final TextEditingController price = TextEditingController();

  String categoryId = '';
  String manufacturersId = '';

  var formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  Future<void> _fetchData() async {
    await HttpRemote.fetchCategories();
    await HttpRemote.fetchManufacturers();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.green,
            // title: const Text('Add Medicine'),
            leading: IconButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => MainDrawer(),
                  ));
                },
                icon: const Icon(Icons.menu_open_sharp)),
            actions: [IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_back_sharp)),
            ]
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
    label: 'sName'.tr ,
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
    label: 'tName'.tr,
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
    controller: quantity,
    type: TextInputType.name,
    label: 'quantity'.tr,
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
    firstDate: DateTime.now().add(const Duration(days: 1)),
    lastDate: DateTime.parse('2024-04-03'))
        .then((value) {
    date.text = '${value?.year}-${value?.month}-${value?.day}';
    });
    },
    controller: date,
    type: TextInputType.name,
    label: 'date'.tr,
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
    label: 'price'.tr,
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
    TextFiledApp(
    controller: companyController,
    type: TextInputType.name,
    label: 'theManufactureCompany'.tr,
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
    MyDropdown(
    items: HttpRemote.categories,
    textKey: 'name',
    valueKey: 'id',
    onchanged: (int id) {
    print(id);
    categoryId = id.toString();
    },
    ),
    MyDropdown(
    items: HttpRemote.manufacturers,
    textKey: 'name',
    valueKey: 'id',
    onchanged: (int id) {
    print(id);
    manufacturersId = id.toString();
    },
    ),
    const SizedBox(
    height: 20,
    ),
    SizedBox(
    width: double.infinity,
    height: 40,
    child: MaterialButton(
    color: Colors.green,
    onPressed: () async {
    if (formKey.currentState!.validate()) {
    bool res = await HttpRemote.addMedicine(
    genericName: scientificName.text,
    brandName: tradeName.text,
    quantity: quantity.text,
    expiryDate: date.text,
    price: price.text,
    categoryId: categoryId,
    manufacturerId: manufacturersId,
    context: context);
    HttpRemote.addCompany(nameCompany: companyController.text);
    if (res) {
    // // ignore: use_build_context_synchronously
    // ScaffoldMessenger.of(context)
    //     .showSnackBar(const SnackBar(
    //   content: Text('add successful'),
    //   backgroundColor: Colors.green,
    // ignore: use_build_context_synchronously
    Navigator.of(context).push(MaterialPageRoute(builder: (context)=> Medicine()),

    );
    }else{ScaffoldMessenger.of(context)
        .showSnackBar(const SnackBar(
       content: Text('Dropdown empty'),
       backgroundColor: Colors.red,
    )); }

    }
    ;
    },
    child: Text(
    'send'.tr,
    style: const TextStyle(fontSize: 17, color: Colors.white),
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
