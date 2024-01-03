import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:untitled1/features/langouge/langouge.dart';

class Controller extends GetxController{
  void changLan(String codeLan){
    Locale locale = Locale(codeLan);
    Get.updateLocale(locale);
  }
}
