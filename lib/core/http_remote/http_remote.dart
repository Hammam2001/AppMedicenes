
import 'dart:convert';
import 'dart:js';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:untitled1/core/global_cubit/global_cubit.dart';

class HttpRemote {


  // Future categories() async {
  //   List par = [];
  //
  //   var response = await http.get(
  //     Uri.parse('http://127.0.0.1:800/api/categories/getAll'),
  //     headers: {
  //       'Accept': 'application/json',
  //     },
  //   );
  //   print(response.body);
  //   if (response.statusCode == 200) {
  //     par = jsonDecode(response.body)['categories'];
  //     print(par);
  //     return response.body;
  //   } else {
  //     ScaffoldMessenger.of(context as BuildContext).showSnackBar(const SnackBar(
  //       content: Text('error occured'),
  //     ));
  //   }
  // }


  static Future<bool> login(
      {required String phone,
        required String password,
        required context}) async {
    var urlLOGIN = Uri.parse('http://127.0.0.1:8000/api/admin/login');
    var respons = await http.post(urlLOGIN, body: {"phone": phone, " password": password,"user_id":'10'});
    print(respons.statusCode);

    var decodedRespon = jsonDecode(respons.body);
    GlobalCubit.get(context).token = decodedRespon['token'];
    print(GlobalCubit.get(context).token);

    if (respons.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  static Future<bool> register(
      {required String firstName,
        required String lastName,
        required String password,
        required String phone,
        required BuildContext context,
        }) async {
        var url = Uri.parse('http://127.0.0.1:8000/api/admin/register');
    var response = await http.post(url, body: {
      "first_name": firstName,
      "last_name": lastName,
      "password": password,
      "phone": phone,
    });
    print(response.statusCode);
    var decodedRespon = jsonDecode(response.body);
    GlobalCubit.get(context).token = decodedRespon['token'];
    print(GlobalCubit.get(context).token);
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }






  static Future<bool> addMedicine(
      {required String genericName,
        required String brandName,
        required String quantity,
        required String expiryDate,
        required String price,
        required BuildContext context,
      }) async {
    var url = Uri.parse('http://127.0.0.1:8000/api/medicines/add');
    var response = await http.post(url, body: {
      "generic_name": genericName,
      "brand_name": brandName,
      "quantity": quantity,
      "expiry_date": expiryDate,
      "price": price,
    },headers: {
    "Authorization": "Bearer ${GlobalCubit.get(context).token}"}
    );
    print(response.statusCode);
    var decodedRespon = jsonDecode(response.body);
    GlobalCubit.get(context).token = decodedRespon['token'];
    print(GlobalCubit.get(context).token);
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }


  static Future<bool> getProduct(context) async {
    var url = Uri.parse('http://127.0.0.1:800/api/categories/getAll');
    var response = await http.get(url, headers: {
      'Accept': 'application/json',

    });

    if (response.statusCode == 200) {
      var decodedRespon = jsonDecode(response.body);
      print(response.body);
      GlobalCubit.get(context).token = decodedRespon['categories'];
      return true;
    }
    return false;
  }
  List<Map<String, dynamic>> categories = [];

  Future<void> fetchCategories() async {
    final response = await http.get(
      Uri.parse('https://your-backend-api/categories'),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body)['categories'];

        categories = List<Map<String, dynamic>>.from(data);

    } else {
      throw Exception('Failed to load categories');
    }
  }

}