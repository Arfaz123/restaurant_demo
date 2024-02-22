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
  List<File?>? path;
  List<String> downloadUrl = [];
  List<NewOption>? categoryList = [];
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
        await FilePicker.platform.pickFiles(allowMultiple: true);

    if (result != null) {
      PlatformFile file = result.files.first;
      path = result.paths.map((e) {
        return File(e!);
      }).toList();
      update();
      print(file.path);
    } else {
      // User canceled the picker
    }
  }

  Future<void> uploadImages() async {
    try {
      downloadUrl = []; // List to store download URLs of uploaded images

      // Iterate over each selected file and upload it to Firebase Storage
      for (File file
          in path!.where((file) => file != null).map((file) => file!)) {
        // Assuming path is List<File>?
        String fileName = DateTime.now().millisecondsSinceEpoch.toString();

        TaskSnapshot snapshot =
            await storage.ref().child("products/$fileName").putFile(
                  file,
                  SettableMetadata(
                    contentDisposition: 'inline; filename="$fileName"',
                    contentType: 'image/png',
                  ),
                );

        if (snapshot.state == TaskState.success) {
          String imageUrl = await snapshot.ref.getDownloadURL();
          downloadUrl.add(imageUrl); // Add the download URL to the list
        }
      }

      // After uploading all images, you can use downloadUrls list as needed
      // For example, you can store them in Firestore or perform other actions

      print("All images uploaded successfully");
    } catch (e) {
      print("Error in Storage: $e");
    }

    update();
  }

  addProductToFireStore() async {
    Get.back();
    await uploadImages();

    CategoryData categoryData = CategoryData(
      title: selectedValue,
      productData: [
        Product(
          images: downloadUrl,
          productName: nameController.text.trim(),
          price: priceController.text.trim(),
        ),
        // Add more products as needed
      ],
      newOption: [NewOption()],
    );

    await fireStore.collection('productList').add({
      "title": categoryData.title,
      "productData":
          categoryData.productData?.map((product) => product.toJson()).toList(),
      "newOption": null,
    });

    // await fireStore.collection('productList').add({
    //   "image": downloadUrl,
    //   "product_name": nameController.text.trim(),
    //   "description": descriptionController.text.trim(),
    //   "price": priceController.text.trim(),
    //   "category": selectedValue
    // });
    downloadUrl = [];
    path = null;
    nameController.clear();
    descriptionController.clear();
    priceController.clear();
    update();
  }

  addPFullProductToFireStore() async {
    Get.back();
    await uploadImages();

    CategoryData categoryData = CategoryData(
        title: selectedValue,
        productData: [
          Product(
            images: downloadUrl,
            productName: nameController.text.trim(),
            price: priceController.text.trim(),
          ),
          // Add more products as needed
        ],
        newOption: categoryList?.map((e) {
          return NewOption(options: e.options, newCategory: e.newCategory);
        }).toList());

    await fireStore.collection('productList').add({
      "title": categoryData.title,
      "productData":
          categoryData.productData?.map((product) => product.toJson()).toList(),
      "newOption":
          categoryData.newOption?.map((option) => option.toJson()).toList(),
    });
    print("Full Prodct Added Successfully");
    downloadUrl = [];
    path = null;
    nameController.clear();
    descriptionController.clear();
    priceController.clear();
    categoryList?.clear();
    update();
  }

  addProductAtIndex() {
    print("data index: $productIndex");
    final newProduct = Options(
      optionName: optionNameController.text.trim(),
      optionPrice: priceOptionController.text.trim(),
    );
    final category = Get.find<HomeController>().categoryList?[productIndex];
    category?.options ??= [];
    category?.options!.add(newProduct);
    optionNameController.clear();
    priceOptionController.clear();
    update();
    // print(
    //     "list length::${Get.find<HomeController>().categoryList[productIndex].newCategory}");
    Get.back();
  }
}

class CategoryData {
  final String title;
  late List<Product>? productData;
  late List<NewOption>? newOption;
  CategoryData({this.title = "", this.productData, this.newOption});

  CategoryData.fromJson(Map<String, dynamic> json)
      : title = json["title"],
        productData = (json['productData'] as List?)
                ?.map(
                    (dynamic e) => Product.fromJson(e as Map<String, dynamic>))
                .toList() ??
            [],
        newOption = (json['newOption'] as List?)
                ?.map((dynamic e) =>
                    NewOption.fromJson(e as Map<String, dynamic>))
                .toList() ??
            [];

  Map<String, dynamic> toJson() => {
        'title': title,
        'productData': productData?.map((e) => e.toJson()).toList(),
        'newOption': newOption?.map((e) => e.toJson()).toList()
      };
}

class Product {
  final String? productName;
  final String? price;
  final List<String>? images;

  Product({this.price = "", this.productName = "", this.images});

  factory Product.fromJson(Map<String, dynamic> json) {
    List<String>? imagesList = [];
    if (json['images'] != null) {
      imagesList = List<String>.from(json['images']);
    }

    return Product(
      productName: json["productName"],
      price: json["price"],
      images: imagesList,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "price": price,
      "productName": productName,
      "images": images,
    };
  }
}

class NewOption {
  final String? newCategory;
  List<Options>? options;

  NewOption({this.newCategory, this.options});

  NewOption.fromJson(Map<String, dynamic> json)
      : newCategory = json["newCategory"],
        options = (json['options'] as List?)
                ?.map(
                    (dynamic e) => Options.fromJson(e as Map<String, dynamic>))
                .toList() ??
            [];

  Map<String, dynamic> toJson() {
    return {
      "newCategory": newCategory,
      "options": options?.map((e) => e.toJson()).toList()
    };
  }
}

class Options {
  final String? optionName;
  final String? optionPrice;

  Options({this.optionName, this.optionPrice});

  Options.fromJson(Map<String, dynamic> json)
      : optionName = json["optionName"],
        optionPrice = json["optionPrice"];

  Map<String, dynamic> toJson() {
    return {"optionName": optionName, "optionPrice": optionPrice};
  }
}
