import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restaurant_demo_app/constant/app_button.dart';
import 'package:restaurant_demo_app/constant/app_color.dart';
import 'package:restaurant_demo_app/controller/home_controller.dart';
import 'package:restaurant_demo_app/screen/home/widget/add_new_category_dialog.dart';
import 'package:restaurant_demo_app/screen/home/widget/add_new_option_dialog.dart';

showOptionDialog(BuildContext context) {
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
              ListView.builder(
                shrinkWrap: true,
                itemCount: controller.categoryList.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Text(
                        controller.categoryList[index].title ?? "",
                        style: const TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w600),
                      ),
                      size.heightSpace(9),
                      controller.categoryList[index].productData == null
                          ? const SizedBox()
                          : SizedBox(
                              height: size.height(100),
                              width: size.width(300),
                              child: ListView.separated(
                                separatorBuilder: (context, index) {
                                  return Container(
                                    color: const Color(0xFF52525242),
                                    height: 1,
                                  );
                                },
                                shrinkWrap: true,
                                itemCount: controller.categoryList[index]
                                        .productData?.length ??
                                    0,
                                itemBuilder: (context, index1) {
                                  return Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            controller
                                                    .categoryList[index]
                                                    .productData?[index1]
                                                    .productName ??
                                                "",
                                            style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w400),
                                          ),
                                          size.heightSpace(3),
                                          Text(
                                            controller
                                                    .categoryList[index]
                                                    .productData?[index1]
                                                    .price ??
                                                "",
                                            style: TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.w400),
                                          ),
                                        ],
                                      ),
                                      IconButton(
                                          onPressed: () {},
                                          icon:
                                              const Icon(Icons.delete_outline))
                                    ],
                                  );
                                },
                              ),
                            ),
                      AppButton(
                        buttonText: "New Option",
                        onPressed: () {
                          controller.productIndex = index;
                          controller.update();
                          showAddNewOptionDialog(context);
                        },
                      ),
                    ],
                  );
                },
              ),

              // size.heightSpace(15),
              // const Text(
              //   "Choose your drink",
              //   style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
              // ),
              // size.heightSpace(9),
              // SizedBox(
              //   height: size.height(100),
              //   width: size.width(300),
              //   child: ListView.separated(
              //     separatorBuilder: (context, index) {
              //       return Container(
              //         color: const Color(0xFF52525242),
              //         height: 1,
              //       );
              //     },
              //     shrinkWrap: true,
              //     itemCount: 2,
              //     itemBuilder: (context, index) {
              //       return Row(
              //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //         crossAxisAlignment: CrossAxisAlignment.center,
              //         children: [
              //           Column(
              //             crossAxisAlignment: CrossAxisAlignment.start,
              //             children: [
              //               const Text(
              //                 "Pepsi",
              //                 style: TextStyle(
              //                     fontSize: 14, fontWeight: FontWeight.w400),
              //               ),
              //               size.heightSpace(3),
              //               const Text(
              //                 "+\$1.50",
              //                 style: TextStyle(
              //                     fontSize: 12, fontWeight: FontWeight.w400),
              //               ),
              //             ],
              //           ),
              //           IconButton(
              //               onPressed: () {},
              //               icon: const Icon(Icons.delete_outline))
              //         ],
              //       );
              //     },
              //   ),
              // ),
              // AppButton(
              //   buttonText: "New Option",
              //   onPressed: () {},
              // ),
              size.heightSpace(30),
              AppButton(
                buttonText: "New Category",
                onPressed: () {
                  showAddCatDialog(context);
                },
              ),
            ],
          ),
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
          onPressed: () {},
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
