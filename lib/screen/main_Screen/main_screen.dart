import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restaurant_demo_app/controller/home_controller.dart';
import 'package:restaurant_demo_app/screen/home/home_screen.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: GetBuilder(
            init: Get.find<HomeController>(),
            builder: (controller) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.black)),
                      onPressed: () {
                        Get.find<HomeController>().isAdmin = true;
                        Get.find<HomeController>().update();
                        controller.productList = FirebaseFirestore.instance.collection('productList').get();
                        controller.update();
                        Get.to(() => const HomeScreen());
                      },
                      child: const Text("Admin Flow")),
                  ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.black)),
                      onPressed: () {
                        Get.find<HomeController>().isAdmin = false;
                        Get.find<HomeController>().update();
                        controller.productList = FirebaseFirestore.instance.collection('productList').get();
                        controller.update();
                        Get.to(() => const HomeScreen());
                      },
                      child: const Text("Client Flow")),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
