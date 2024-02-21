import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restaurant_demo_app/constant/app_button.dart';
import 'package:restaurant_demo_app/constant/app_color.dart';
import 'package:restaurant_demo_app/constant/app_text_field.dart';
import 'package:restaurant_demo_app/controller/home_controller.dart';

showAddCatDialog(BuildContext context) {
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
              "Add New Category",
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
            ),
            size.heightSpace(15),
            AppTextField(
              controller: controller.newCategoryController,
              hintText: "Enter Category Name",
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
            Get.find<HomeController>().categoryList.add(CategoryData(
                title: Get.find<HomeController>()
                    .newCategoryController
                    .text
                    .trim()));
            Get.find<HomeController>().update();
            print("list length::${Get.find<HomeController>().categoryList}");
            Get.back();
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
