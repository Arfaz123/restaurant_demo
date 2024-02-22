import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restaurant_demo_app/constant/app_button.dart';
import 'package:restaurant_demo_app/constant/app_color.dart';
import 'package:restaurant_demo_app/controller/home_controller.dart';
import 'package:restaurant_demo_app/screen/home/widget/cart_dialog.dart';

showCartViewDialog(BuildContext context) {
  AlertDialog alert = AlertDialog(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    contentPadding: const EdgeInsets.symmetric(horizontal: 17, vertical: 10),
    content: GetBuilder(
      init: Get.find<HomeController>(),
      builder: (controller) {
        return controller.cartList.isEmpty
            ? const SizedBox()
            : SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    size.heightSpace(15),
                    Text(
                      controller.cartList[0]["title"].toString(),
                      style: const TextStyle(
                          fontSize: 15, fontWeight: FontWeight.w600),
                    ),
                    size.heightSpace(3),
                    Center(
                      child: Image.network(
                        controller.cartList[0]["productData"][0]["images"][0]
                            .toString(),
                        height: size.height(180),
                        width: size.width(180),
                      ),
                    ),
                    size.heightSpace(9),
                    Text(
                      "description",
                      // controller.cartList[0]["description"] ?? "",
                      style:
                          TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
                    ),
                    size.heightSpace(40),
                    ListView.builder(
                      itemCount: controller.cartList[0]["newOption"].length,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            Text(
                              controller.cartList[0]["newOption"][index]
                                      ["newCategory"] ??
                                  "",
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold),
                            ),
                            size.heightSpace(9),
                            SizedBox(
                              height: size.height(100),
                              width: size.width(300),
                              child: ListView.separated(
                                physics: NeverScrollableScrollPhysics(),
                                separatorBuilder: (context, index1) {
                                  return Container(
                                    color: const Color(0xFF52525242),
                                    height: 1,
                                  );
                                },
                                shrinkWrap: true,
                                itemCount: controller
                                    .cartList[0]["newOption"][index]["options"]
                                    .length,
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
                                            controller.cartList[0]["newOption"]
                                                        [index]["options"]
                                                    [index1]["optionName"] ??
                                                "",
                                            style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w400),
                                          ),
                                          size.heightSpace(3),
                                          Text(
                                            controller.cartList[0]["newOption"]
                                                        [index]["options"]
                                                    [index1]["optionPrice"] ??
                                                "",
                                            style: TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.w400),
                                          ),
                                        ],
                                      ),
                                      Checkbox(
                                        tristate: true,
                                        activeColor: AppColor.blackColor,
                                        value: controller.cartList[0]
                                                ["newOption"][index]["options"]
                                            [index1]["isSelected"],
                                        onChanged: (value) {
                                          controller.cartList[0]["newOption"]
                                                  [index]["options"][index1]
                                              ["isSelected"] = value!;
                                          controller.update();
                                        },
                                      )
                                    ],
                                  );
                                },
                              ),
                            ),
                            size.heightSpace(15),
                          ],
                        );
                      },
                    ),

                    // const Text(
                    //   "Choose your drink",
                    //   style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
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
                    //                     fontSize: 14,
                    //                     fontWeight: FontWeight.w400),
                    //               ),
                    //               size.heightSpace(3),
                    //               const Text(
                    //                 "+\$1.50",
                    //                 style: TextStyle(
                    //                     fontSize: 12,
                    //                     fontWeight: FontWeight.w400),
                    //               ),
                    //             ],
                    //           ),
                    //           Checkbox(
                    //             activeColor: AppColor.blackColor,
                    //             value: controller.drinkValue,
                    //             onChanged: (value) {
                    //               controller.drinkValue = value!;
                    //               controller.update();
                    //             },
                    //           )
                    //         ],
                    //       );
                    //     },
                    //   ),
                    // ),
                    // size.heightSpace(23),
                    AppButton(
                      buttonText: "Save \$7.00",
                      onPressed: () {
                        Get.back();
                        showCartDetailsDialog(context);
                      },
                    ),
                  ],
                ),
              );
      },
    ),
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
