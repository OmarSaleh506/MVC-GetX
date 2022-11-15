import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mvc_getx/model/product_modle.dart';
import 'package:mvc_getx/routes/routes.dart';

import '../../utils/theme/theme.dart';

class CartController extends GetxController {
  var productMap = {}.obs;

  void addProductToCart(ProductModels productModels) {
    if (productMap.containsKey(productModels)) {
      productMap[productModels] += 1;
    } else {
      productMap[productModels] = 1;
    }
  }

  get productSubTotal =>
      productMap.entries.map((e) => e.key.price * e.value).toList();
  get total => productMap.entries
      .map((e) => e.key.price * e.value)
      .toList()
      .reduce((value, element) => value + element)
      .toStringAsFixed(2);

  void removeProductFromCart(ProductModels productModels) {
    if (productMap.containsKey(productModels) &&
        productMap[productModels] == 1) {
      productMap.removeWhere((key, value) => key == productModels);
    } else {
      productMap[productModels] -= 1;
    }
  }

  void removeOneProduct(ProductModels productModels) {
    productMap.removeWhere((key, value) => key == productModels);
  }

  void clearAllProduct() {
    Get.defaultDialog(
      title: 'Clean Products',
      titleStyle: const TextStyle(
        fontSize: 18,
        color: Colors.black,
        fontWeight: FontWeight.bold,
      ),
      middleText: 'Are you sure you need to Clean products',
      middleTextStyle: const TextStyle(
        fontSize: 18,
        color: Colors.black,
        fontWeight: FontWeight.bold,
      ),
      backgroundColor: Colors.grey,
      radius: 10,
      textCancel: 'No',
      cancelTextColor: Colors.black,
      textConfirm: 'Yes',
      confirmTextColor: Colors.white,
      onCancel: () {
        Get.toNamed(Routes.cardScreen);
      },
      onConfirm: () {
        productMap.clear();
        Get.back();
      },
      buttonColor: Get.isDarkMode ? pinkClr : mainColor,
    );
  }

  int quantity() {
    if (productMap.isEmpty) {
      return 0;
    } else {
      return productMap.entries
          .map((e) => e.value)
          .toList()
          .reduce((value, element) => value + element);
    }
  }
}
