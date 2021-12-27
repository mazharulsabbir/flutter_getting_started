import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:get/get.dart';

import '/constraints/images.dart';
import '../screens/wrapper.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    if (SchedulerBinding.instance != null) {
      SchedulerBinding.instance?.addPostFrameCallback((timeStamp) {
        Get.off(() => const Wrapper());
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(appIconTransparent),
      ),
    );
  }
}
