import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mvc_getx/logic/controller/auth_controller.dart';
import 'package:mvc_getx/logic/controller/settings_controller.dart';
import 'package:mvc_getx/view/widgets/text_utils.dart';

class ProfileWidget extends StatelessWidget {
  ProfileWidget({super.key});
  final controller = Get.find<SettingController>();
  final authController = Get.find<AuthController>();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Obx(
          () => Row(
            children: [
              Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: NetworkImage(
                      authController.displayUserPhoto.value,
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(
                width: 15,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextUtils(
                    text: controller
                        .capitalize(authController.displayUserName.value),
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Get.isDarkMode ? Colors.white : Colors.black,
                    underLine: TextDecoration.none,
                  ),
                  TextUtils(
                    text: authController.displayUserEmail.value,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Get.isDarkMode ? Colors.white : Colors.black,
                    underLine: TextDecoration.none,
                  ),
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}
