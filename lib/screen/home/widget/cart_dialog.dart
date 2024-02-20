import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restaurant_demo_app/constant/app_button.dart';
import 'package:restaurant_demo_app/constant/app_color.dart';
import 'package:restaurant_demo_app/controller/home_controller.dart';
import 'package:restaurant_demo_app/screen/home/order_successfull_dialog.dart';

showCartDetailsDialog(BuildContext context) {
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
            Center(child: Text("Cart",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)),
            size.heightSpace(9),
            SizedBox(
              height: size.height(100),
              width: size.width(300),
              child: ListView.builder(
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
            size.heightSpace(5),
            Container(color: Color(0xFF52525242),height: 1,),
            size.heightSpace(8),
            Text("IVU",style: TextStyle(fontSize: 14,fontWeight: FontWeight.w400),),
            size.heightSpace(3),
            Text("+\$0.67",style: TextStyle(fontSize: 12,fontWeight: FontWeight.w400),),
            size.heightSpace(31),
            AppButton(buttonText: "Save \$7.00", onPressed: () {
              Get.back();
              showSuccessFullAlertDialog(context);
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