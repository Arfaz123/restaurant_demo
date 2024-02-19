import 'package:flutter/material.dart';
import 'package:restaurant_demo_app/constant/app_color.dart';

class AppTextField extends StatelessWidget {
  const AppTextField(
      {super.key,
        required this.controller,
        this.onChange,
        this.lableText,
        this.hintText,
        this.height,
        this.leftMargin,
        this.rightMargin,
        this.topMargin,
        this.readOnly = false,
        this.bottomMargin,
        this.backgroundColor,
        this.enabledRadius,
        this.focusedRadius,
        this.isForPassword = false,
        this.errorMessage,
        this.suffixIcon,
        this.prefixIcon,
        this.textAlign,
        this.textInputAction,
        this.fillWithParent = false,
        this.maxLine,
        this.keyboardType,
        this.validator,
        this.onTap});

  final TextEditingController controller;
  final ValueChanged<String>? onChange;
  final String? lableText;
  final String? hintText;
  final double? height;
  final double? leftMargin;
  final double? rightMargin;
  final double? topMargin;
  final double? bottomMargin;
  final Color? backgroundColor;
  final double? enabledRadius;
  final double? focusedRadius;
  final bool isForPassword;
  final String? errorMessage;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final TextAlign? textAlign;
  final int? maxLine;
  final bool readOnly;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;
  final TextInputAction? textInputAction;
  final bool fillWithParent;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTap: onTap,
      textInputAction: textInputAction,
      keyboardType: keyboardType,
      obscureText: isForPassword,
      onChanged: onChange,
      controller: controller,
      style: TextStyle(fontSize: 15,fontWeight: FontWeight.w400),
      cursorColor: AppColor.blackColor,
      textAlign: textAlign ?? TextAlign.start,
      maxLines: maxLine ?? 1,
      validator: validator,
      readOnly: readOnly,
      decoration: InputDecoration(
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,contentPadding: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
        isDense: true,
        hintText: hintText,
        hintStyle: TextStyle(fontSize: 15,fontWeight: FontWeight.w400,color: AppColor.k888888Color),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
          borderSide: const BorderSide(color: AppColor.blackColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
          borderSide: const BorderSide(color: AppColor.blackColor),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
          borderSide: const BorderSide(color: AppColor.blackColor),
        ),
        errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4),
            borderSide: const BorderSide(color: Colors.red)),
        fillColor: AppColor.whiteColor,
        filled: true,
        focusColor: AppColor.blackColor,
      ),
    );
  }
}
