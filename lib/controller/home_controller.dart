import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController newCategoryController = TextEditingController();
  final TextEditingController optionNameController = TextEditingController();
  final TextEditingController priceOptionController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  bool isAdmin = false;
  File? path;
  String downloadUrl = "";
  List<CategoryData> categoryList = [];
  int productIndex = 0;
  FirebaseFirestore fireStore = FirebaseFirestore.instance;
  FirebaseStorage storage = FirebaseStorage.instance;

  var dropDownItems = [
    'Sandwish',
    'Salads',
  ];

  String selectedValue = "Sandwish";

  bool cartValue = false;
  bool drinkValue = false;

  openExplorer() async {
    FilePickerResult? result =
        await FilePicker.platform.pickFiles(allowMultiple: false);

    if (result != null) {
      PlatformFile file = result.files.first;
      path = File(result.paths.first ?? "");
      update();
      print(file.path);
    } else {
      // User canceled the picker
    }
  }

  Future<void> uploadImage() async {
    try {
      String fileName = DateTime.now().millisecondsSinceEpoch.toString();

      TaskSnapshot snapshot =
          await storage.ref().child("products/$fileName").putFile(
                path!,
                SettableMetadata(
                  contentDisposition: 'inline; filename="$fileName"',
                  contentType: 'image/png',
                ),
              );

      if (snapshot.state == TaskState.success) {
        downloadUrl = "";
        update();
        downloadUrl = await snapshot.ref.getDownloadURL();

        update();
      }
    } catch (e) {
      print("error in Staorage:: $e");
    }

    update();
  }

  addProductToFireStore() async {
    Get.back();
    await uploadImage();
    await fireStore.collection('productList').add({
      "image": downloadUrl,
      "product_name": nameController.text.trim(),
      "description": descriptionController.text.trim(),
      "price": priceController.text.trim(),
      "category": selectedValue
    });
    downloadUrl = "";
    path = null;
    nameController.clear();
    descriptionController.clear();
    priceController.clear();
    update();
  }

  addProductAtIndex() {
    print("data index: $productIndex");
    final newProduct = Product(
      productName: optionNameController.text.trim(),
      price: priceOptionController.text.trim(),
    );
    final category = Get.find<HomeController>().categoryList[productIndex];
    category.productData ??= [];
    category.productData!.add(newProduct);
    update();
    print(
        "list length::${Get.find<HomeController>().categoryList[productIndex].productData}");
    Get.back();
  }
}

class CategoryData {
  final String title;
  late List<Product>? productData;
  CategoryData({this.title = "", this.productData});

  CategoryData.fromJson(Map<String, dynamic> json)
      : title = json["title"],
        productData = (json['productData'] as List?)
                ?.map(
                    (dynamic e) => Product.fromJson(e as Map<String, dynamic>))
                .toList() ??
            [];

  Map<String, dynamic> toJson() => {
        'title': title,
        'productData': productData?.map((e) => e.toJson()).toList()
      };
}

class Product {
  final String? productName;
  final String? price;

  Product({this.price = "", this.productName = ""});

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      productName: json["productName"],
      price: json["price"],
    );
  }

  Map<String, dynamic> toJson() {
    return {"price": price, "productName": productName};
  }
}
