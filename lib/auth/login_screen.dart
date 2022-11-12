import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mvc_getx/auth/forgot_pasword_screen.dart';

import '../logic/controllers/bindings/auth_controller.dart';
import '../routes/routes.dart';
import '../utils/my_string.dart';
import '../utils/theme/theme.dart';
import '../view/widgets/auth/auth_button.dart';
import '../view/widgets/auth/auth_text_from_field.dart';
import '../view/widgets/auth/container_under.dart';
import '../view/widgets/text_utils.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);
  final fromKey = GlobalKey<FormState>();
  final controller = Get.find<AuthController>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Get.isDarkMode ? Colors.white : darkGreyClr,
          elevation: 0,
        ),
        backgroundColor: Get.isDarkMode ? Colors.white : darkGreyClr,
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                width: double.infinity,
                height: MediaQuery.of(context).size.height / 1.3,
                child: Padding(
                  padding: const EdgeInsets.only(left: 25, right: 25, top: 40),
                  child: Form(
                    key: fromKey,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            TextUtils(
                              text: 'LOG',
                              fontSize: 28,
                              fontWeight: FontWeight.w500,
                              color: Get.isDarkMode ? mainColor : pinkClr,
                              underLine: TextDecoration.none,
                            ),
                            SizedBox(
                              width: 3,
                            ),
                            TextUtils(
                              text: 'IN',
                              fontSize: 28,
                              fontWeight: FontWeight.w500,
                              color:
                                  Get.isDarkMode ? Colors.black : Colors.white,
                              underLine: TextDecoration.none,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 50,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        AuthTextFromField(
                          controller: emailController,
                          obscureText: false,
                          validator: (value) {
                            if (!RegExp(validationEmail).hasMatch(value)) {
                              return 'Enter valid Email';
                            } else {
                              return null;
                            }
                          },
                          prefixIcon: Get.isDarkMode
                              ? Image.asset('assets/images/email.png')
                              : Icon(
                                  Icons.email,
                                  color: pinkClr,
                                  size: 30,
                                ),
                          suffixIcon: Text(''),
                          hintText: 'Email',
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        GetBuilder<AuthController>(builder: (_) {
                          return AuthTextFromField(
                            controller: passwordController,
                            obscureText: controller.isVisibility ? false : true,
                            validator: (value) {
                              if (value.toString().length < 6) {
                                return 'Password should be longer to 6 characters';
                              } else {
                                return null;
                              }
                            },
                            prefixIcon: Get.isDarkMode
                                ? Image.asset('assets/images/lock.png')
                                : Icon(
                                    Icons.lock,
                                    color: pinkClr,
                                    size: 30,
                                  ),
                            suffixIcon: IconButton(
                              onPressed: () {
                                controller.visibility();
                              },
                              icon: controller.isVisibility
                                  ? const Icon(
                                      Icons.visibility_off,
                                    )
                                  : const Icon(
                                      Icons.visibility,
                                      color: Colors.black,
                                    ),
                              color: Colors.black,
                            ),
                            hintText: 'Password',
                          );
                        }),
                        Align(
                          alignment: Alignment.centerRight,
                          child: TextButton(
                              onPressed: () {
                                Get.toNamed(Routes.forgotPasswordScreen);
                              },
                              child: TextUtils(
                                text: 'ForgotPassword?',
                                color: Get.isDarkMode
                                    ? Colors.black
                                    : Colors.white,
                                fontSize: 14,
                                underLine: TextDecoration.none,
                                fontWeight: FontWeight.normal,
                              )),
                        ),
                        const SizedBox(
                          height: 50,
                        ),
                        const SizedBox(
                          height: 50,
                        ),
                        AuthButton(
                          onPressed: () {},
                          text: 'LOG IN',
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextUtils(
                          text: 'OR',
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Get.isDarkMode ? Colors.black : Colors.white,
                          underLine: TextDecoration.none,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            InkWell(
                                onTap: () {},
                                child:
                                    Image.asset('assets/images/facebook.png')),
                            const SizedBox(
                              width: 10,
                            ),
                            InkWell(
                              onTap: () {},
                              child: Image.asset('assets/images/google.png'),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
              ContainerUnder(
                text: 'Don`t have an Account? ',
                textType: 'Sign up',
                onPressed: () {
                  Get.offNamed(Routes.signUpScreen);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
