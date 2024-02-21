import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  bool isAdmin = false;

  var dropDownItems = [
    'Sandwish',
    'Salads',
  ];

  String selectedValue = "Sandwish";

  bool cartValue = false;
  bool drinkValue = false;
}
