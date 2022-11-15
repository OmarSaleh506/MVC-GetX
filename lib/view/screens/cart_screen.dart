import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mvc_getx/logic/controller/cart_controller.dart';
import 'package:mvc_getx/utils/theme/theme.dart';

import '../widgets/card/card_product.dart';
import '../widgets/card/cart_total.dart';
import '../widgets/card/empty_card.dart';

class CardScreen extends StatelessWidget {
  CardScreen({super.key});
  final controller = Get.find<CartController>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: context.theme.backgroundColor,
        appBar: AppBar(
          title: const Text('CardItems'),
          elevation: 0,
          backgroundColor: Get.isDarkMode ? darkGreyClr : mainColor,
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: () {
                controller.clearAllProduct();
              },
              icon: const Icon(Icons.backspace),
            ),
          ],
        ),
        body: Obx(
          () {
            if (controller.productMap.isEmpty) {
              return const EmptyCard();
            } else {
              return SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: 600,
                      child: ListView.separated(
                        itemBuilder: (context, index) {
                          return CartProductCard(
                            index: index,
                            productModels:
                                controller.productMap.keys.toList()[index],
                            quantity:
                                controller.productMap.values.toList()[index],
                          );
                        },
                        separatorBuilder: (context, index) => SizedBox(
                          height: 20,
                        ),
                        itemCount: controller.productMap.length,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        bottom: 30,
                      ),
                      child: CardTotal(),
                    )
                  ],
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
