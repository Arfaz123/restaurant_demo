import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restaurant_demo_app/constant/app_button.dart';
import 'package:restaurant_demo_app/constant/app_color.dart';
import 'package:restaurant_demo_app/controller/home_controller.dart';

showSuccessFullAlertDialog(BuildContext context) {
  AlertDialog alert = AlertDialog(
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10)),
    contentPadding: EdgeInsets.symmetric(horizontal: 17,vertical: 10),
    content: GetBuilder(
      init: Get.find<HomeController>(),
      builder: (controller) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            size.heightSpace(15),
            Center(child: Text("Your Order",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600),)),
            size.heightSpace(24),
            Center(child: Text("Your order has been placed, please wait and we will send you a message as soon as it is ready for delivery.",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 12,fontWeight: FontWeight.w400),)),
            size.heightSpace(30),
            AppButton(buttonText: "Excellent", onPressed: () {
            },),
            size.heightSpace(16),
          ],
        );
      },),
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}