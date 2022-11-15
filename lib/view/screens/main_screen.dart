import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mvc_getx/logic/controller/cart_controller.dart';
import 'package:mvc_getx/logic/controller/main_controller.dart';
import 'package:mvc_getx/routes/routes.dart';
import 'package:mvc_getx/utils/theme/theme.dart';

class MainScreen extends StatelessWidget {
  MainScreen({super.key});
  final controller = Get.find<MainController>();
  final cartController = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Obx(
        () => Scaffold(
          backgroundColor: context.theme.backgroundColor,
          appBar: AppBar(
            elevation: 0,
            leading: Container(),
            actions: [
              Obx(
                () => Badge(
                  position: BadgePosition.topEnd(top: 0, end: 3),
                  animationDuration: const Duration(milliseconds: 300),
                  animationType: BadgeAnimationType.slide,
                  badgeContent: Text(
                    cartController.quantity().toString(),
                    style: const TextStyle(color: Colors.white),
                  ),
                  child: IconButton(
                    onPressed: () {
                      Get.toNamed(Routes.cardScreen);
                    },
                    icon: Image.asset('assets/images/shop.png'),
                  ),
                ),
              ),
            ],
            title: Text(controller.title[controller.currentIndex.value]),
            centerTitle: true,
            backgroundColor: Get.isDarkMode ? darkGreyClr : mainColor,
          ),
          bottomNavigationBar: BottomNavigationBar(
            backgroundColor: Get.isDarkMode ? darkGreyClr : Colors.white,
            currentIndex: controller.currentIndex.value,
            type: BottomNavigationBarType.fixed,
            items: [
              BottomNavigationBarItem(
                activeIcon: Icon(
                  Icons.home,
                  color: Get.isDarkMode ? pinkClr : mainColor,
                ),
                icon: Icon(
                  Icons.home,
                  color: Get.isDarkMode ? Colors.white : Colors.black,
                ),
                label: '',
              ),
              BottomNavigationBarItem(
                activeIcon: Icon(
                  Icons.category,
                  color: Get.isDarkMode ? pinkClr : mainColor,
                ),
                icon: Icon(
                  Icons.category,
                  color: Get.isDarkMode ? Colors.white : Colors.black,
                ),
                label: '',
              ),
              BottomNavigationBarItem(
                activeIcon: Icon(
                  Icons.favorite,
                  color: Get.isDarkMode ? pinkClr : mainColor,
                ),
                icon: Icon(
                  Icons.favorite,
                  color: Get.isDarkMode ? Colors.white : Colors.black,
                ),
                label: '',
              ),
              BottomNavigationBarItem(
                activeIcon: Icon(
                  Icons.settings,
                  color: Get.isDarkMode ? pinkClr : mainColor,
                ),
                icon: Icon(
                  Icons.settings,
                  color: Get.isDarkMode ? Colors.white : Colors.black,
                ),
                label: '',
              ),
            ],
            onTap: (index) {
              controller.currentIndex.value = index;
            },
          ),
          body: IndexedStack(
            index: controller.currentIndex.value,
            children: controller.tabs.value,
          ),
        ),
      ),
    );
  }
}
