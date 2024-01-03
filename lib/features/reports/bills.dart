import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled1/core/http_remote/http_remote.dart';



class Bills extends StatelessWidget {
  Bills({
    super.key,
  });


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      body: Center(
          child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: Colors.green,
              ),
              height: 400,
              width: 600,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white),
                    width: 400,
                    height: 80,
                    child:  Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'tName'.tr + ': ',
                            style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'cetamol',
                            style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white),
                    width: 400,
                    height: 80,
                    child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '${'requestTimes'.tr}: ',
                              style: const TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              '10',
                              style: const TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                          ],
                        )),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white),
                    width: 400,
                    height: 80,
                    child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '${'totalProfits'.tr}: ',
                              style: const TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              '4000',
                              style: const TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                          ],
                        )),
                  ),
                ],
              ))),
    );
  }
}