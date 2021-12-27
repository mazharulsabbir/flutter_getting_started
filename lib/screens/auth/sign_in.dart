import 'package:flutter/material.dart';
import 'package:flutter_mobile_template/controller/auth_controller.dart';
import 'package:get/get.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final AuthController _authController = Get.find<AuthController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          _authController.setUserLoggedInStatus(true);
        },
        label: const Text('Sign In'),
      ),
    );
  }
}
