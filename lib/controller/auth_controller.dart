import 'package:flutter_mobile_template/data/local/storage_utils.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  final _isLoggedIn = false.obs;

  bool get isUserLoggedIn => _isLoggedIn.value;

  AuthController() {
    _isLoggedIn.value = StorageUtils.isUserLoggedIn();  
  }

  void setUserLoggedInStatus(bool status) {
    _isLoggedIn.value = status;
    StorageUtils.isUserLoggedIn(status);
    update();
  }
}
