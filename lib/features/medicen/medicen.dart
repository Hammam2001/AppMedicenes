import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled1/core/http_remote/http_remote.dart';
import 'package:untitled1/features/langouge/langouge.dart';
import '../search/search.dart';
import 'details.dart';

class Model {
  final String name;
  final String date;
  final String price;

  Model({
    required this.name,
    required this.price,
    required this.date,
  });
}

class Medicine extends StatelessWidget {
  Medicine({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      appBar: AppBar(
        backgroundColor: Colors.green,
        title:  Text('medicines'.tr),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => SearchCategory()));
              },
              icon: const Icon(
                Icons.search,
                color: Colors.black,
              ))
        ],
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(60, 40, 60, 40),
            child: FutureBuilder(
              future: HttpRemote.getMedicines(),
              builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                return SizedBox(
                  height: MediaQuery.of(context).size.height,
                  child: ListView.separated(
                      itemBuilder: (context, index) {
                        Map<String, dynamic> allMedicines =
                            HttpRemote.medicines[index];
                        return Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10)),
                          height: 60,
                          child: TextButton(
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => Details(
                                  price: allMedicines['price'],
                                  brandName: allMedicines['brand_name'],
                                  genericName: allMedicines['generic_name'],
                                ),
                              ));
                            },
                            child: Center(
                              child: Text(allMedicines['brand_name'],
                                  style: const TextStyle(
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black)),
                            ),
                          ),
                        );
                      },
                      separatorBuilder: (context, index) => const SizedBox(
                            height: 10,
                          ),
                      itemCount: HttpRemote.medicines.length),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
