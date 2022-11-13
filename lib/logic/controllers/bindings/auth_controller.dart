import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  bool isVisibility = false;
  bool isCheckBox = false;
  FirebaseAuth auth = FirebaseAuth.instance;

  void visibility() {
    isVisibility = !isVisibility;
    update();
  }

  void checkBox() {
    isCheckBox = !isCheckBox;
    update();
  }
}

void signUpUsingFirebase({
  required String name,
  required String email,
  required String password,
}) async {
  try {
    await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    // update();
  } on FirebaseAuthException catch (error) {
    String title = error.code;
    String message = "";

    if (error.code == 'weak-password') {
      message = 'The password provided is too weak.';
    } else if (error.code == 'email-already-in-use') {
      message = 'The account already exists for that email.';
    } else {
      message = error.message.toString();
    }
    Get.snackbar(
      title,
      message,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.green,
      colorText: Colors.white,
    );
  } catch (error) {
    Get.snackbar(
      'Error!',
      error.toString(),
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.green,
      colorText: Colors.white,
    );
  }
}

void logInUsingFirebase() {}
void googleSinUpApp() {}
void resetPassword() {}
void signOutUsingFirebase() {}
void faceBookSignUpApp() {}
