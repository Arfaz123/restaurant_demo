import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restaurant_demo_app/constant/app_color.dart';
import 'package:restaurant_demo_app/controller/home_controller.dart';
import 'package:restaurant_demo_app/screen/home/add_product_dialog.dart';
import 'package:restaurant_demo_app/screen/home/order_successfull_dialog.dart';
import 'package:restaurant_demo_app/screen/home/widget/cart_dialog.dart';
import 'package:restaurant_demo_app/screen/home/widget/cart_view_dialog.dart';
import 'package:restaurant_demo_app/screen/home/widget/home_screen_widget.dart';
import 'package:restaurant_demo_app/screen/home/widget/show_option_dialog.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: Get.find<HomeController>(),
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: AppColor.blackColor,
            title: const Text(
              "Business Name",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
            ),
            elevation: 10,
            actions: [
              GestureDetector(
                  onTap: () {},
                  child: Image.asset(
                    'assets/images/ic_call.png',
                    height: size.height(25),
                    width: size.width(25),
                  )),
              size.widthSpace(25),
              GestureDetector(
                  onTap: () {},
                  child: Image.asset('assets/images/ic_whatsapp.png',
                      height: size.height(25), width: size.width(25))),
              size.widthSpace(14),
            ],
          ),
          backgroundColor: AppColor.whiteColor,
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(left: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  size.heightSpace(35),
                  controller.isAdmin
                      ? const SizedBox()
                      : Padding(
                          padding: const EdgeInsets.only(right: 16),
                          child: GestureDetector(
                            onTap: () {
                              showCartViewDialog(context);
                            },
                            child: Align(
                              alignment: Alignment.bottomRight,
                              child: Container(
                                width: size.width(100),
                                padding:
                                    const EdgeInsets.symmetric(vertical: 10),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(100),
                                    color: AppColor.blackColor),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Icon(
                                      Icons.shopping_cart,
                                      color: AppColor.whiteColor,
                                      size: 20,
                                    ),
                                    size.widthSpace(13),
                                    const Text(
                                      "Cart",
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                          color: AppColor.whiteColor),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                  size.heightSpace(22),
                  const Text(
                    "Salads",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                  ),
                  size.heightSpace(11),
                  SizedBox(
                    height: size.height(200),
                    child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return const HomeScreenWidget(
                              image: "assets/images/ic_chicken.png",
                              name: "Chicken Salad",
                              price: "\$7.00");
                        },
                        separatorBuilder: (context, index) {
                          return size.widthSpace(22);
                        },
                        itemCount: 5),
                  ),
                  size.heightSpace(31),
                  const Text(
                    "Salads",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                  ),
                  size.heightSpace(11),
                  SizedBox(
                    height: size.height(200),
                    child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return const HomeScreenWidget(
                              image: "assets/images/ic_chicken.png",
                              name: "Chicken Salad",
                              price: "\$7.00");
                        },
                        separatorBuilder: (context, index) {
                          return size.widthSpace(22);
                        },
                        itemCount: 5),
                  ),
                  size.heightSpace(31),
                  const Text(
                    "Salads",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                  ),
                  size.heightSpace(11),
                  SizedBox(
                    height: size.height(200),
                    child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return const HomeScreenWidget(
                              image: "assets/images/ic_chicken.png",
                              name: "Chicken Salad",
                              price: "\$7.00");
                        },
                        separatorBuilder: (context, index) {
                          return size.widthSpace(22);
                        },
                        itemCount: 5),
                  )
                ],
              ),
            ),
          ),
          floatingActionButton: controller.isAdmin
              ? FloatingActionButton(
                  backgroundColor: AppColor.blackColor,
                  child: const Icon(
                    Icons.add,
                    color: AppColor.whiteColor,
                    size: 35,
                  ),
                  onPressed: () {
                    showAddProductDialog(context);
                  },
                )
              : const SizedBox(),
        );
      },
    );
  }
}
