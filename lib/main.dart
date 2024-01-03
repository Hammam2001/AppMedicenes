import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:untitled1/core/global_cubit/global_cubit.dart';
import 'package:untitled1/features/add_medicine/admin.dart';
import 'package:untitled1/features/langouge/conroller.dart';
import 'package:untitled1/features/langouge/langouge.dart';
import 'package:untitled1/features/login/login_page.dart';
import 'package:untitled1/features/medicen/medicen.dart';
import 'package:untitled1/features/register/register_page.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'features/drawer.dart';
import 'features/orders/payment_state.dart';
import 'features/orders/view_order.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(Controller());
    return BlocProvider(
      create: (context) => GlobalCubit(),
      child: GetMaterialApp(
        locale: Get.deviceLocale,
        translations: Local(),
        // localizationsDelegates: const [
        //   GlobalWidgetsLocalizations.delegate,
        //   GlobalMaterialLocalizations.delegate,
        //   GlobalCupertinoLocalizations.delegate
        // ]
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primaryColor: Colors.green),
        home: Login(),
      ),
    );
  }
}
