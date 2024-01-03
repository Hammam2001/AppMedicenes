import 'package:flutter/material.dart';
import 'package:untitled1/features/drawer.dart';
import 'package:untitled1/features/orders/payment_state.dart';


class OrderWidget extends StatefulWidget {
  const OrderWidget({Key? key, required this.id, required this.brandName, required this.scientificName, required this.price, required this.quantity, required this.orderState, required this.paymentState}) : super(key: key);

  final int id;
  final String brandName;
  final String scientificName ;
  final String price ;
  final int quantity ;
  final String orderState;
  final String paymentState;

  @override
  State<OrderWidget> createState() => _MedicineWidget2State();
}

class _MedicineWidget2State extends State<OrderWidget> {

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          border: Border.all(
              color: Theme.of(context).primaryColor),
        ),
        padding: const EdgeInsets.all(8),
        margin: const EdgeInsets.all(5),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset("assets/image/121.jpg",width: 110,),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextButton(onPressed: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>PaymentState(orderId: widget.id.toString(),)));
                }, child: Text(
                    widget.brandName,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    )
                ),),
                const SizedBox(height: 10),
                Text(
                  widget.scientificName,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: const TextStyle(
                    color: Colors.black54,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Text(
                  widget.orderState,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: const TextStyle(
                    color: Colors.black54,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  widget.paymentState,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: const TextStyle(
                    color: Colors.black54,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  '${widget.price} S.P',
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: const TextStyle(
                    color: Colors.black54,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  widget.quantity.toString(),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: const TextStyle(
                    color: Colors.black54,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

