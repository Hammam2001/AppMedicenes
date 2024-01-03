import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled1/core/http_remote/http_remote.dart';
import 'package:untitled1/features/langouge/langouge.dart';

import 'order_widget.dart';

class OrderView extends StatelessWidget {
  OrderView({
    Key? key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
        centerTitle: true,
        title: Text(
          'orders'.tr,
          style: const TextStyle(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.w400),
        ),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: FutureBuilder<List<Map<String, dynamic>>>(
              future: HttpRemote.getOrderDetails(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Container(
                    height: MediaQuery.of(context).size.height,
                    color: Colors.white,
                    alignment: Alignment.center,
                    child: CircularProgressIndicator(
                      color: Theme.of(context).primaryColor,
                    ),
                  );
                } else if (snapshot.hasData &&
                    (snapshot.data?.isNotEmpty ?? false)) {
                  final orders = snapshot.data!;
                  return Container(
                    padding: const EdgeInsets.all(15),
                    child: Column(
                      children: [
                        ListView.builder(
                          itemCount: orders.length,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            Map<String, dynamic> order = orders[index];
                            return OrderWidget(
                              id: order['order_id'],
                              brandName: order['brand_name'],
                              scientificName: order['generic_name'],
                              price: order['total_price'],
                              quantity: order['quantity_orderd'],
                              orderState: order['order_status'],
                              paymentState: order['payment_status'],
                            );
                          },
                        ),
                      ],
                    ),
                  );
                } else {
                  return const Center(child: Text("NO data"));
                }
              }),
        ),
      ),
    );
  }
}
