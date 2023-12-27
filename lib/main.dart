import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled1/core/global_cubit/global_cubit.dart';
import 'package:untitled1/features/add_medicine/admin.dart';
import 'package:untitled1/features/login/login_page.dart';
import 'package:untitled1/features/register/register_page.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GlobalCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primaryColor: Colors.green),
        home: AddMedicine(),
      ),
    );
  }
}
