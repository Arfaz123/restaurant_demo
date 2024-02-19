import 'package:get/get.dart';
import 'package:restaurant_demo_app/controller/home_controller.dart';

class RootBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(HomeController());
  }
}