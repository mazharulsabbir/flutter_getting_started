import 'package:flutter_mobile_template/controller/ads_controller.dart';
import 'package:flutter_mobile_template/controller/notification_controller.dart';

import '../controller/auth_controller.dart';
import 'package:get/get.dart';

class GlobalBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(PushNotificationController());
    Get.put(AdsController());
    Get.put(AuthController());
  }
}
