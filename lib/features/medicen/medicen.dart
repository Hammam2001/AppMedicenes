import 'package:flutter/material.dart';

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

class Med extends StatelessWidget {
  Med({super.key});

  List<Model> user = [
    Model(name: "setamol ", date: "10/1/2023", price: '10000'),
    Model(name: "prfen  ", date: "12/11/2023", price: '5900'),
    Model(name: "SODIUM  ", date: "5/9/2023", price: '41200'),
    Model(name: "CHLORIDE ", date: "8/8/2023", price: '5000'),
    Model(name: "POTASSIUM  ", date: "9/9/2023", price: '6800'),
    Model(name: "CHLORIDE ", date: "8/7/2023", price: '8000'),
    Model(name: "PSEUDOEPHEDRINE ", date: "11/10/2023", price: '9400'),
    Model(name: "setamol ", date: "10/1/2023", price: '10000'),
    Model(name: "prfen  ", date: "12/11/2023", price: '5900'),
    Model(name: "SODIUM  ", date: "5/9/2023", price: '41200'),
    Model(name: "CHLORIDE ", date: "8/8/2023", price: '5000'),
    Model(name: "POTASSIUM  ", date: "9/9/2023", price: '6800'),
    Model(name: "CHLORIDE ", date: "8/7/2023", price: '8000'),
    Model(name: "PSEUDOEPHEDRINE ", date: "11/10/2023", price: '9400'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text('Medcine'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView.separated(
            itemBuilder: (context, index) => item(user[index], context),
            separatorBuilder: (context, index) => const SizedBox(
                  height: 10,
                ),
            itemCount: user.length),
      ),
    );
  }
}

Widget item(Model user, context) => Container(
      child: Row(
        children: [
          Text(
            '${user.name} ',
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 20,
          ),
          Column(
            children: [
              Text('Price : ${user.price}', style: const TextStyle(fontSize: 18)),
              const SizedBox(
                width: 40,
              ),
              const SizedBox(
                width: 40,
              ),
              Text('  ${user.date}',
                  style: TextStyle(fontSize: 18, color: Colors.grey))
            ],
          ),

        ],
      ),
    );
