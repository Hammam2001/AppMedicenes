import 'dart:convert';
import 'dart:js';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:untitled1/core/end_points/end_points.dart';
import 'package:untitled1/core/global_cubit/global_cubit.dart';
import 'package:untitled1/features/langouge/conroller.dart';

class HttpRemote {
  static Future<bool> login({required String phone,
    required String password,
    required context}) async {
    var urlLOGIN = Uri.parse('${EndPoints.baseUrl}${EndPoints.adminLogin}');
    var response = await http.post(urlLOGIN,
        body: {"phone": phone, "password": password,});
    print(response.statusCode);

    if (response.statusCode == 200) {
      var decodedRespon = jsonDecode(response.body);
      GlobalCubit
          .get(context)
          .token = decodedRespon['token']['accessToken'];
      print(GlobalCubit
          .get(context)
          .token);
      return true;
    } else {
      return false;
    }
  }

  static Future<bool> register({
    required String firstName,
    required String lastName,
    required String password,
    required String phone,
    required BuildContext context,
  }) async {
    var url = Uri.parse('${EndPoints.baseUrl}${EndPoints.adminRegister}');
    var response = await http.post(url, body: {
      "first_name": firstName,
      "last_name": lastName,
      "password": password,
      "phone": phone,
      'password_confirmation': password,
    },);
    print(response.statusCode);
    print(response.body);
    // ignore: use_build_context_synchronously
    // ignore: use_build_context_synchronously
    if (response.statusCode == 200) {
      var decodedRespon = jsonDecode(response.body);
      // ignore: use_build_context_synchronously
      GlobalCubit
          .get(context)
          .token = decodedRespon['token'];
      // ignore: use_build_context_synchronously
      print(GlobalCubit
          .get(context)
          .token);
      return true;
    } else {
      return false;
    }
  }

  static Future<bool> changePaymentState(
      {required String paymentId, required String orderId}) async {
    print({
      'payment_id': paymentId,
      'order_id': orderId,
    },);
    var url = Uri.parse('${EndPoints.baseUrl}${EndPoints.paymentState}');
    var response = await http.post(url, body: {
      'payment_id': paymentId,
      'order_id': orderId,

    }, headers: {
      'Accept': 'application/json',
    });
    print(response.statusCode);
    print(response.body);
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  static Future<bool> changeState({required String orderStateId}) async {
    var url = Uri.parse('${EndPoints.baseUrl}${EndPoints.orderState}');
    var response = await http.post(url, body: {
      'order_status_id': orderStateId,
    }, headers: {
      'Accept': 'application/json',
    });
    print(response.statusCode);
    print(response.body);
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }
static List<Map<String, dynamic>> search=[];
  static Future<List<Map<String, dynamic>>> searchCategory(
      {required String name}) async {
    var url = Uri.parse('${EndPoints.baseUrl}${EndPoints.searchCategory}');
    var response = await http.post(url, body: {
      'name': name,
    }, headers: {
      'Accept': 'application/json',
    });
    print(response.statusCode);


    if (response.statusCode == 200) {
      final body = jsonDecode(response.body);
      final result = body['categories'];
      return search = List<Map<String, dynamic>>.from(result);
    } else {
      return [];
    }
  }

  static Future<bool> addMedicine({
    required String genericName,
    required String brandName,
    required String quantity,
    required String expiryDate,
    required String price,
    required String categoryId,
    required String manufacturerId,
    required BuildContext context,
  }) async {
    var url = Uri.parse('${EndPoints.baseUrl}${EndPoints.medicinesAdd}');
    var response = await http.post(url, body: {
      "generic_name": genericName,
      "brand_name": brandName,
      "quantity": quantity,
      "expiry_date": expiryDate,
      "price": price,
      'category_id': categoryId,
      'company_id': manufacturerId,
    }, headers: {
      // "Authorization": "Bearer ${GlobalCubit.get(context).token}",
      "Accept": 'application/json',
    });
    print(response.statusCode);
    print(response.body);
    if (response.statusCode <= 300 && response.statusCode >= 200) {
      return true;
    } else {
      return false;
    }
  }

  static List<Map<String, dynamic>> medicinesDetails = [];

  static Future<void> getMedicinesDetails(String id) async {
    final response = await http.get(
      Uri.parse('${EndPoints.baseUrl}${EndPoints.medicinesDetails}$id'),
      headers: {'Accept': 'application/json'},
    );

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body)['medicine'];
      medicinesDetails = List<Map<String, dynamic>>.from(data);
    } else {
      throw Exception('Failed to load categories');
    }
  }

  static List<Map<String, dynamic>> categories = [];

  static Future<void> fetchCategories() async {
    final response = await http.get(
      Uri.parse('${EndPoints.baseUrl}${EndPoints.adminCategory}'),
      headers: {'Accept': 'application/json'},
    );

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body)['categories'];
      categories = List<Map<String, dynamic>>.from(data);
    } else {
      throw Exception('Failed to load categories');
    }
  }

  static List<Map<String, dynamic>> manufacturers = [];

  static Future<void> fetchManufacturers() async {
    final response = await http.get(
      Uri.parse('${EndPoints.baseUrl}${EndPoints.getAllManufacturers}'),
      headers: {'Accept': 'application/json'},
    );

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body)['manufacturers'];
      manufacturers = List<Map<String, dynamic>>.from(data);
    } else {
      throw Exception('Failed to load categories');
    }
  }

  static List<Map<String, dynamic>> medicines = [];

  static Future<void> getMedicines() async {
    final response = await http.get(
      Uri.parse('${EndPoints.baseUrl}${EndPoints.medicineGetAll}'),
      headers: {'Accept': 'application/json'},
    );

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body)['medicines'];
      medicines = List<Map<String, dynamic>>.from(data);
    } else {
      throw Exception('Failed to load medicines');
    }
  }

  static List<Map<String, dynamic>> detailsOrder = [];

  static Future<List<Map<String, dynamic>>> getOrderDetails() async {
    var response = await http.get(
        Uri.parse('${EndPoints.baseUrl}${EndPoints.adminOrders}'),
        headers: {
          'Accept': 'application/json',
        });
    print(response.body);
    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body)['orders'];
      detailsOrder = List<Map<String, dynamic>>.from(data);
      return detailsOrder;
    } else {
      return [];
    }
  }
static List<Map<String, dynamic>> total=[];
  static Future<Object> dateReport(
      {required String start, required String end}) async
  {
    var url = Uri.parse('${EndPoints.baseUrl}${EndPoints.dateReport}');
    var response = await http.post(url, body: {
      'start_date': start,
      'ending_date': end,
    },
        headers: {
          'Accept': 'application/json',
        }
    );
    print(response.statusCode);
    print(response.body);
    if (response.statusCode == 200) {

      List<dynamic> data = jsonDecode(response.body)['total profits'];
      total = List<Map<String, dynamic>>.from(data);
      return total ;
    }else{
      return false;
    }
  }


  static Future<bool> addCompany(
      { required String nameCompany}) async
  {

    var url = Uri.parse('${EndPoints.baseUrl}${EndPoints.addCompany}');
    var response = await http.post(url, body: {
      'name': nameCompany,
    },
        headers: {
          'Accept': 'application/json',
        }
    );
    print(response.statusCode);
    print(response.body);
    if (response.statusCode <= 300 && response.statusCode >= 200) {
      return true;
    }else{
      return false;
    }
  }

  static List<Map<String, dynamic>> profits = [];

  static Future<List<Map<String, dynamic>>> getProfits() async {
    var response = await http.get(
        Uri.parse('${EndPoints.baseUrl}${EndPoints.profits}'),
        headers: {
          'Accept': 'application/json',
        });
    print(response.body);
    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body)['medicine'];
      profits = List<Map<String, dynamic>>.from(data);
      return profits;
    } else {
      return [];
    }
    }
}
