import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mvc_getx/utils/theme/theme.dart';
import 'package:mvc_getx/view/widgets/text_utils.dart';

import '../widgets/home/card_items.dart';
import '../widgets/home/search_from_text.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: context.theme.backgroundColor,
        body: Column(
          children: [
            Container(
              width: double.infinity,
              height: 180,
              decoration: BoxDecoration(
                color: Get.isDarkMode ? darkGreyClr : mainColor,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 20,
                  right: 20,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    TextUtils(
                      text: 'Find your',
                      fontSize: 25,
                      fontWeight: FontWeight.normal,
                      color: Colors.white,
                      underLine: TextDecoration.none,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    TextUtils(
                      text: 'INSPIRATION',
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      underLine: TextDecoration.none,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    SearchFromText(),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Align(
                alignment: Alignment.topLeft,
                child: TextUtils(
                  text: 'Categories',
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: Get.isDarkMode ? Colors.white : Colors.black,
                  underLine: TextDecoration.none,
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            CardItems(),
          ],
        ),
      ),
    );
  }
}
