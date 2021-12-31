import '../controller/ads_controller.dart';
import '../controller/device_info_controller.dart';
import '../controller/notification_controller.dart';

import '../controller/auth_controller.dart';
import 'package:get/get.dart';

class GlobalBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(DeviceInfoController());
    Get.put(PushNotificationController());
    Get.put(AdsController());
    Get.put(AuthController());
  }
}
