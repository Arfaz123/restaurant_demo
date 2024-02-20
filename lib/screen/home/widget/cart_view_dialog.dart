import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restaurant_demo_app/constant/app_button.dart';
import 'package:restaurant_demo_app/constant/app_color.dart';
import 'package:restaurant_demo_app/controller/home_controller.dart';
import 'package:restaurant_demo_app/screen/home/widget/cart_dialog.dart';

showCartViewDialog(BuildContext context) {
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
            Text("Chicken Salad",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w600),),
            size.heightSpace(3),
            Image.asset("assets/images/ic_chicken_banner.png"),
            size.heightSpace(9),
            Text("This is a description of the chicken salad set by the administrator.",style: TextStyle(fontSize: 12,fontWeight: FontWeight.w400),),
            size.heightSpace(40),
            Text("What sauces do you want?",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
            size.heightSpace(9),
            SizedBox(
              height: size.height(100),
              width: size.width(300),
              child: ListView.separated(
                separatorBuilder: (context, index) {
                  return Container(color: Color(0xFF52525242),height: 1,);
                },
                shrinkWrap: true,
                itemCount: 2,
                itemBuilder: (context, index) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("BBQ Sauce",style: TextStyle(fontSize: 14,fontWeight: FontWeight.w400),),
                          size.heightSpace(3),
                          Text("+\$0.34",style: TextStyle(fontSize: 12,fontWeight: FontWeight.w400),),
                        ],
                      ),
                      Checkbox(
                        activeColor: AppColor.blackColor,
                        value: controller.cartValue, onChanged: (value) {
                          controller.cartValue = value!;
                          controller.update();
                      },)
                    ],
                  );
                },),
            ),
            size.heightSpace(15),
            Text("Choose your drink",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
            size.heightSpace(9),
            SizedBox(
              height: size.height(100),
              width: size.width(300),
              child: ListView.separated(
                separatorBuilder: (context, index) {
                  return Container(color: Color(0xFF52525242),height: 1,);
                },
                shrinkWrap: true,
                itemCount: 2,
                itemBuilder: (context, index) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Pepsi",style: TextStyle(fontSize: 14,fontWeight: FontWeight.w400),),
                          size.heightSpace(3),
                          Text("+\$1.50",style: TextStyle(fontSize: 12,fontWeight: FontWeight.w400),),
                        ],
                      ),
                      Checkbox(
                        activeColor: AppColor.blackColor,
                        value: controller.drinkValue, onChanged: (value) {
                        controller.drinkValue = value!;
                        controller.update();
                      },)
                    ],
                  );
                },),
            ),
            size.heightSpace(23),
            AppButton(buttonText: "Save \$7.00", onPressed: () {
              Get.back();
              showCartDetailsDialog(context);
            },),
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