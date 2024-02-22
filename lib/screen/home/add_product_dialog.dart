import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restaurant_demo_app/constant/app_button.dart';
import 'package:restaurant_demo_app/constant/app_color.dart';
import 'package:restaurant_demo_app/constant/app_text_field.dart';
import 'package:restaurant_demo_app/controller/home_controller.dart';
import 'package:restaurant_demo_app/screen/home/widget/show_option_dialog.dart';

showAddProductDialog(BuildContext context) {
  AlertDialog alert = AlertDialog(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    contentPadding: const EdgeInsets.symmetric(horizontal: 17, vertical: 10),
    content: GetBuilder(
      init: Get.find<HomeController>(),
      builder: (controller) {
        return SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              size.heightSpace(15),
              const Text(
                "Images",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              ),
              size.heightSpace(15),
              controller.path == null || controller.path!.isEmpty
                  ? const SizedBox()
                  : SizedBox(
                      height: size.height(150),
                      width: size.height(300),
                      child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return Stack(
                              children: [
                                Image.file(controller.path![index]!),
                                Positioned(
                                  bottom: 15,
                                  right: 10,
                                  child: GestureDetector(
                                    onTap: () {
                                      controller.path!.removeAt(index);
                                    },
                                    child: Container(
                                      padding: const EdgeInsets.all(5),
                                      decoration: BoxDecoration(
                                          color: AppColor.whiteColor,
                                          borderRadius:
                                              BorderRadius.circular(100),
                                          boxShadow: [
                                            const BoxShadow(
                                                offset: Offset(0, 4),
                                                blurRadius: 4,
                                                color: Color(0xFF00000040))
                                          ]),
                                      child: const Icon(
                                        Icons.delete_outline,
                                        color: AppColor.blackColor,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            );
                          },
                          separatorBuilder: (context, index) {
                            return size.widthSpace(22);
                          },
                          itemCount: controller.path?.length ?? 0),
                    ),
              size.heightSpace(16),
              AppButton(
                buttonText: "Select Images",
                onPressed: () {
                  controller.openExplorer();
                },
              ),
              size.heightSpace(16),
              Row(
                children: [
                  Expanded(
                    child: SizedBox(
                        height: size.height(40),
                        child: AppTextField(
                          controller: controller.nameController,
                          hintText: "Name of the Product",
                        )),
                  ),
                  size.widthSpace(12),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: AppColor.blackColor),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton(
                          iconEnabledColor: AppColor.whiteColor,
                          iconDisabledColor: AppColor.whiteColor,
                          style: const TextStyle(
                              color: AppColor.whiteColor,
                              fontSize: 15,
                              fontWeight: FontWeight.w400),
                          items: controller.dropDownItems.map((String items) {
                            return DropdownMenuItem(
                              value: items,
                              child: Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 21, vertical: 5),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      color: AppColor.blackColor),
                                  child: Text(items)),
                            );
                          }).toList(),
                          icon: const Icon(
                            Icons.keyboard_arrow_down_rounded,
                            color: AppColor.whiteColor,
                          ),
                          padding: const EdgeInsets.only(
                            right: 10,
                          ),
                          value: controller.selectedValue,
                          onChanged: (String? value) {
                            controller.selectedValue = value ?? "";
                            controller.update();
                          }),
                    ),
                  )
                ],
              ),
              size.heightSpace(11),
              SizedBox(
                  height: size.height(115),
                  child: AppTextField(
                    controller: controller.descriptionController,
                    hintText: "Description",
                    maxLine: 5,
                  )),
              size.heightSpace(11),
              SizedBox(
                  height: size.height(45),
                  child: AppTextField(
                    controller: controller.priceController,
                    hintText: "Price",
                  )),
              size.heightSpace(11),
              AppButton(
                buttonText: "Add Option",
                onPressed: () {
                  Get.back();
                  showOptionDialog(context);
                },
              ),
              size.heightSpace(30),
            ],
          ),
        );
      },
    ),
    actions: [
      TextButton(
          onPressed: () {
            Get.back();
            Get.find<HomeController>().path = null;
            Get.find<HomeController>().nameController.clear();
            Get.find<HomeController>().descriptionController.clear();
            Get.find<HomeController>().priceController.clear();
            Get.find<HomeController>().update();
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
            if (Get.find<HomeController>().nameController.text.isEmpty) {
              Get.showSnackbar(const GetSnackBar(
                message: "Please insert name",
                margin: EdgeInsets.all(16),
                borderRadius: 10,
                dismissDirection: DismissDirection.startToEnd,
                isDismissible: true,
                duration: Duration(seconds: 1),
              ));
            } else if (Get.find<HomeController>()
                .descriptionController
                .text
                .isEmpty) {
              Get.showSnackbar(const GetSnackBar(
                message: "Please insert description",
                margin: EdgeInsets.all(16),
                borderRadius: 10,
                dismissDirection: DismissDirection.startToEnd,
                isDismissible: true,
                duration: Duration(seconds: 1),
              ));
            } else if (Get.find<HomeController>()
                .priceController
                .text
                .isEmpty) {
              Get.showSnackbar(const GetSnackBar(
                message: "Please insert price",
                margin: EdgeInsets.all(16),
                borderRadius: 10,
                dismissDirection: DismissDirection.startToEnd,
                isDismissible: true,
                duration: Duration(seconds: 1),
              ));
            } else {
              Get.find<HomeController>().addProductToFireStore();
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
