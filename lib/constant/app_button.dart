// ignore_for_file: sort_child_properties_last, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:restaurant_demo_app/constant/app_color.dart';

class AppButton extends StatelessWidget {
  final String buttonText;
  final Function() onPressed;
  final double horizontalPadding;

  const AppButton(
      {Key? key,
        required this.buttonText,
        required this.onPressed,
        this.horizontalPadding = 0.0})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(
            vertical: size.height(10), horizontal: horizontalPadding),
        backgroundColor: AppColor.blackColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0), // Set the border radius
        ),
      ),
      child: Center(
          child: Text(
            buttonText,
            style: TextStyle(
                color: AppColor.whiteColor, fontSize: 15, fontWeight: FontWeight.w400),
          )),
      onPressed: onPressed,
    );
  }
}
