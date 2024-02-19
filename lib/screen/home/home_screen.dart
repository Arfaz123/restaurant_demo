import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restaurant_demo_app/controller/home_controller.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: Get.find<HomeController>(),
      builder: (controller) {
      return Scaffold(
        appBar: AppBar(
          
        ),
      );
    },);
  }
}
