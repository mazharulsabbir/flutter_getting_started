import 'package:flutter/material.dart';
import '/controller/auth_controller.dart';
import '/controller/home_controller.dart';
import '/screens/auth/sign_in.dart';
import '/screens/home/home.dart';
import 'package:get/get.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(
        init: AuthController(),
        builder: (controller) {
          if (controller.isUserLoggedIn) {
            Get.put(HomeController());
            return const HomePage();
          } else {
            return const SignInPage();
          }
        });
  }
}
