import 'package:flutter_calc/controllers/calculator.dart';
import 'package:get/get.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(CalcController());
  }
}
