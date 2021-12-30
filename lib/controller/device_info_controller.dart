import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:device_info/device_info.dart';

class DeviceInfoController extends GetxController {

  AndroidDeviceInfo? androidInfo;
  IosDeviceInfo? iosInfo;
  
  @override
  void onInit() {
    super.onInit();
    _getDeviceInfo();
  }

  Future<void> _getDeviceInfo() async {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    androidInfo = await deviceInfo.androidInfo;
    debugPrint('Running on ${androidInfo?.model}'); // e.g. "Moto G (4)"

    iosInfo = await deviceInfo.iosInfo;
    debugPrint('Running on ${iosInfo?.utsname.machine}'); // e.g. "iPod7,1"

    update();
  }
}
