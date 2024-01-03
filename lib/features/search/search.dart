import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled1/core/http_remote/http_remote.dart';
import '../../core/app_text_form/app_text-form_filed.dart';

class SearchCategory extends StatelessWidget {
  SearchCategory({super.key});

  TextEditingController searchController = TextEditingController();
  List<Map<String, dynamic>> _categories = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: TextFiledApp(
              controller: searchController,
              label: 'search'.tr,
              type: TextInputType.text,
              obscurePassword: false,
              onchange: (value) async {
                _categories = await HttpRemote.searchCategory(
                    name: searchController.text);
                print(_categories);
              },
            ),
          ),
          // ListView.separated(
          //     itemBuilder: (context, index) {
          //       Map<String, dynamic> allMedicines = HttpRemote.search['name'] ;
          //     },
          //     separatorBuilder: (context, index) => const SizedBox(
          //           height: 10,
          //         ),
          //     itemCount: _categories.length)
        ],
      ),
    );
  }
}
