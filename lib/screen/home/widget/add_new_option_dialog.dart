import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restaurant_demo_app/constant/app_button.dart';
import 'package:restaurant_demo_app/constant/app_color.dart';
import 'package:restaurant_demo_app/constant/app_text_field.dart';
import 'package:restaurant_demo_app/controller/home_controller.dart';

showAddNewOptionDialog(BuildContext context) {
  AlertDialog alert = AlertDialog(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    contentPadding: const EdgeInsets.symmetric(horizontal: 17, vertical: 10),
    content: GetBuilder(
      init: Get.find<HomeController>(),
      builder: (controller) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            size.heightSpace(15),
            const Text(
              "Add New Option",
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
            ),
            size.heightSpace(15),
            AppTextField(
              controller: controller.optionNameController,
              hintText: "Enter Option Name",
            ),
            size.heightSpace(15),
            AppTextField(
              controller: controller.priceOptionController,
              hintText: "Enter Price or Free",
              keyboardType: TextInputType.number,
            ),
          ],
        );
      },
    ),
    actions: [
      TextButton(
          onPressed: () {
            Get.back();
          },
          child: const Text(
            "Cancel",
            style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w600,
                color: AppColor.blackColor),
          )),
      TextButton(
          onPressed: () {
            if (Get.find<HomeController>().optionNameController.text.isEmpty) {
              Get.showSnackbar(const GetSnackBar(
                  message: "Please insert name",
                  margin: EdgeInsets.all(16),
                  borderRadius: 10,
                  dismissDirection: DismissDirection.startToEnd,
                  isDismissible: true,
                  duration: Duration(seconds: 1)));
            } else if (Get.find<HomeController>()
                .priceOptionController
                .text
                .isEmpty) {
              Get.showSnackbar(const GetSnackBar(
                  message: "Please insert price",
                  margin: EdgeInsets.all(16),
                  borderRadius: 10,
                  dismissDirection: DismissDirection.startToEnd,
                  isDismissible: true,
                  duration: Duration(seconds: 1)));
            } else {
              Get.find<HomeController>().addProductAtIndex();
            }
          },
          child: const Text(
            "Save",
            style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w600,
                color: AppColor.blackColor),
          )),
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
