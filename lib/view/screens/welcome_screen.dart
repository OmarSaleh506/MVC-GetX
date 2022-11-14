import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'auth/login_screen.dart';
import '../../routes/routes.dart';
import '../../utils/theme/theme.dart';
import '../widgets/text_utils.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            SizedBox(
              width: double.infinity,
              height: double.infinity,
              child: Image.asset(
                'assets/images/background.png',
                fit: BoxFit.cover,
              ),
            ),
            Container(
              color: Colors.black.withOpacity(0.2),
              width: double.infinity,
              height: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 100,
                  ),
                  Container(
                      height: 60,
                      width: 190,
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Center(
                        child: TextUtils(
                          underLine: TextDecoration.none,
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                          text: 'Welcome',
                          color: Colors.white,
                        ),
                      )),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                      height: 60,
                      width: 230,
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextUtils(
                            underLine: TextDecoration.none,
                            fontSize: 35,
                            fontWeight: FontWeight.bold,
                            text: 'Asroo',
                            color: mainColor,
                          ),
                          const SizedBox(
                            width: 7,
                          ),
                          TextUtils(
                            underLine: TextDecoration.none,
                            fontSize: 35,
                            fontWeight: FontWeight.bold,
                            text: 'Shope',
                            color: Colors.white,
                          ),
                        ],
                      )),
                  const SizedBox(
                    height: 250,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: mainColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 40,
                        vertical: 12,
                      ),
                    ),
                    onPressed: () {
                      Get.offNamed(Routes.loginScreen);
                    },
                    child: TextUtils(
                      text: 'Get Start',
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      underLine: TextDecoration.none,
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextUtils(
                        text: 'Don`t have an Account?',
                        fontSize: 18,
                        fontWeight: FontWeight.normal,
                        color: Colors.white,
                        underLine: TextDecoration.none,
                      ),
                      TextButton(
                        onPressed: () {
                          Get.offNamed(Routes.signUpScreen);
                        },
                        child: TextUtils(
                          underLine: TextDecoration.underline,
                          text: 'Signup',
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.normal,
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
