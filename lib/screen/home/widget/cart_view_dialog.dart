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
                    SizedBox(
                      height: size.height(500),
                      width: size.width(300),
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: controller.cartList.length ?? 0,
                        itemBuilder: (context, index1) {
                        return Column(
                          children: [
                            size.heightSpace(15),
                            Text(
                              controller.cartList[index1]["title"].toString(),
                              style: const TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.w600),
                            ),
                            size.heightSpace(10),
                            Center(
                              child: Image.network(
                                controller.cartList[index1]["productData"][0]["images"][0]
                                    .toString(),
                                height: size.height(100),
                                width: size.width(180),
                              ),
                            ),
                            size.heightSpace(9),
                            Text(
                              controller.cartList[index1]["productData"][0]["description"] ?? "",
                              style:
                              TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
                            ),
                            size.heightSpace(40),
                            SizedBox(
                              height: size.height(80),
                              width: size.width(300),
                              child: ListView.builder(
                                itemCount: controller.cartList[index1]["newOption"].length ?? 0,
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                itemBuilder: (context, index2) {
                                  return Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        controller.cartList[index1]["newOption"][index2]
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
                                          separatorBuilder: (context, index) {
                                            return Container(
                                              color: const Color(0xFF52525242),
                                              height: 1,
                                            );
                                          },
                                          shrinkWrap: true,
                                          itemCount: controller
                                              .cartList[index1]["newOption"][index2]["options"]
                                              .length ?? 0,
                                          itemBuilder: (context, index3) {
                                            print("BOOL value==>${controller.cartList[index1]
                                            ["newOption"][index2]["options"]
                                            [index3]["isSelected"]}");
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
                                                      controller.cartList[index1]["newOption"]
                                                      [index2]["options"]
                                                      [index3]["optionName"] ??
                                                          "",
                                                      style: TextStyle(
                                                          fontSize: 14,
                                                          fontWeight: FontWeight.w400),
                                                    ),
                                                    size.heightSpace(3),
                                                    Text(
                                                      controller.cartList[index1]["newOption"]
                                                      [index2]["options"]
                                                      [index3]["optionPrice"] ??
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
                                                  value: controller.cartList[index1]
                                                  ["newOption"][index2]["options"]
                                                  [index3]["isSelected"],
                                                  onChanged: (value) {
                                                    controller.cartList[index1]["newOption"]
                                                    [index2]["options"][index3]
                                                    ["isSelected"] = value!;
                                                    print("value===>$value");
                                                    controller.update();
                                                    print("value12===>${controller.cartList[index1]["newOption"]
                                                    [index2]["options"][index3]
                                                    ["isSelected"]}");
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
                            ),
                          ],
                        );
                      },),
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
