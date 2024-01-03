import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled1/features/orders/view_order.dart';
import 'package:untitled1/features/reports/bills.dart';
import 'package:untitled1/features/reports/report.dart';
import 'langouge/conroller.dart';

class MainDrawer extends StatefulWidget {
  const MainDrawer({Key? key}) : super(key: key);

  @override
  State<MainDrawer> createState() => _MainDrawerState();
}

class _MainDrawerState extends State<MainDrawer> {
  Controller controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: SizedBox(
          height: double.infinity,
          width: 100,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  alignment: Alignment.center,
                  width: 300,
                  height: 100,
                  decoration:
                  BoxDecoration(color: Theme.of(context).primaryColor),
                  child: Row(
                    children: [
                      IconButton(onPressed: (){Navigator.pop(context);}, icon: const Icon(Icons.arrow_back,color: Colors.black,)),
                      const SizedBox(width: 15,),
                      Text(
                        'getYourMedicine'.tr,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                InkWell(
                  onTap: () {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => OrderView(),)) ;
                  },
                  child:  Row(
                    children: [
                      const Icon(Icons.shopping_cart_checkout_sharp),
                      const SizedBox(
                        width: 30,
                      ),
                      Text(
                        'orders'.tr,
                        style: const TextStyle(color: Colors.black54, fontSize: 18),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),

                Text(
                  'changeLanguage'.tr,
                  style: const TextStyle(color: Colors.black54, fontSize: 18),
                ),
                const SizedBox(height: 10,),
                Row(
                  children: [
                    MaterialButton(onPressed: (){
                      controller.changLan('ar');
                    },
                      color: Theme.of(context).primaryColor, child:  Text('arabic'.tr,
                        style: const TextStyle(fontSize: 17, color: Colors.white)),
                    ),
                    const SizedBox(width: 15,),
                    MaterialButton(onPressed: (){
                      controller.changLan('en');
                    },
                      color: Theme.of(context).primaryColor, child: Text('english'.tr,
                        style: const TextStyle(fontSize: 17, color: Colors.white)),
                    ),
                  ],
                ),
                const SizedBox(height: 20,),
                MaterialButton(onPressed: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=> Reports()));
                },
                  color: Theme.of(context).primaryColor, child:  Text('reports'.tr,
                      style: const TextStyle(fontSize: 17, color: Colors.white)),
                ),
                const SizedBox(height: 20,),
                MaterialButton(onPressed: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=> Bills()));
                },
                  color: Theme.of(context).primaryColor, child:  Text('profits'.tr,
                      style: const TextStyle(fontSize: 17, color: Colors.white)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
