import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled1/core/http_remote/http_remote.dart';
import 'package:untitled1/features/reports/total.dart';

import '../../core/app_text_form/app_text-form_filed.dart';
import 'bills.dart';

class Reports extends StatelessWidget {
   Reports({super.key, });
   TextEditingController startDate = TextEditingController();
   TextEditingController lastDate = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(),
      backgroundColor: Colors.green,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            margin: const EdgeInsets.all(40),
            decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(10)),
              height: 400,
              width: 300,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFiledApp(
                  onTap: () {
                    showDatePicker(
                        context: context,
                        firstDate: DateTime.now().add(const Duration(days: 1)),
                        lastDate: DateTime.parse('2024-04-03'))
                        .then((value) {
                      startDate.text = '${value?.year}-${value?.month}-${value?.day}';
                    });
                  },
                  controller: startDate,
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
                const SizedBox(height: 30,),
                TextFiledApp(
                  onTap: () {
                    showDatePicker(
                        context: context,
                        firstDate: DateTime.now().add(const Duration(days: 1)),
                        lastDate: DateTime.parse('2024-06-06'))
                        .then((value) {
                      lastDate.text = '${value?.year}-${value?.month}-${value?.day}';
                    });
                  },
                  controller: lastDate,
                  type: TextInputType.name,
                  label: 'endDate'.tr,
                  obscurePassword: false,
                  validate: (String value) {
                    if (value.isEmpty) {
                      return 'date must be not empty';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20,),


                const SizedBox(height: 30,),
                MaterialButton(onPressed: () async {
                  bool res= (await (HttpRemote.dateReport(
                      start: startDate.toString(),
                      end: lastDate.toString()))) as bool;
                  if(res){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>   Total()));
                     }
                },
                  color: Colors.white,
                  child: Text('send'.tr),)
              ],
            ),
              ),
        ),
      ));
  }
}
