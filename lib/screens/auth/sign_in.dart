import 'package:flutter/material.dart';
import 'package:flutter_mobile_template/controller/ads_controller.dart';
import 'package:flutter_mobile_template/controller/auth_controller.dart';
import 'package:get/get.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final AuthController _authController = Get.find<AuthController>();
  final AdsController _adsController = Get.find<AdsController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
          await _authController.signInWithGoogle();
          // await _authController.signInWithFacebook();
          // _authController.setUserLoggedInStatus(true);
          // _adsController.showInterstitialAd();
        },
        label: const Text('Sign In'),
      ),
    );
  }
}
