import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled1/core/drop_down/drop.dart';
import 'package:untitled1/core/http_remote/http_remote.dart';

class PaymentState extends StatelessWidget {
  PaymentState({super.key, required this.orderId});
 final String orderId;
  String name = '';

  List<Map<String, dynamic>> paymentState = [
    {
      'id': '1',
      'name': 'unpaid',
    },
    {
      'id': '2',
      'name': 'paid',
    }
  ];
  List<Map<String, dynamic>> orderState = [
    {
      'id': '1',
      'name': 'send'.tr,
    },
    {
      'id': '2',
      'name': 'preparationIsDone'.tr,
    },
    {
      'id': '3',
      'name': 'recipient'.tr,
    },
    {
      'id': '4',
      'name': 'unacceptable'.tr,
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      appBar: AppBar(
        title: Text('changeState'.tr),
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: Container(
          decoration: BoxDecoration(
              color: Colors.green, borderRadius: BorderRadius.circular(10)),
          height: 400,
          width: 300,
          child: Column(
            children: [
              Container(
                color: Colors.white,
                child: MyDropdown(
                    onchanged: (int id) {
                      print(id);
                      name = id.toString();
                    },
                    items: paymentState,
                    valueKey: 'id',
                    textKey: 'name'),
              ),
              const SizedBox(height: 50,),
              Container(
                color: Colors.white,
                child: MyDropdown(
                    onchanged: (int id) {
                      print(id);
                      name = id.toString();
                    },
                    items: orderState,
                    valueKey: 'id',
                    textKey: 'name'),
              ),
              const SizedBox(height: 50,),

              MaterialButton(onPressed: () async {
                bool res = (await HttpRemote.changePaymentState(paymentId: name, orderId: orderId,));
                    if(res)
                {
                  // ignore: use_build_context_synchronously
                  ScaffoldMessenger.of(context)
                      .showSnackBar(const SnackBar(
                    content: Text('add successful'),
                    backgroundColor: Colors.white,
                  )
                  );
                }
              },
                color: Colors.white,
                child: Text('send'.tr),)
            ],
          ),
        ),
      ),
    );
  }
}
