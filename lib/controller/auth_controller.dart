import 'package:flutter_mobile_template/data/local/storage_utils.dart';
import 'package:get/get.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

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

  Future<dynamic> signInWithFacebook() async {
    final LoginResult result = await FacebookAuth.instance
        .login(); // by default we request the email and the public profile
    // or FacebookAuth.i.login()
    if (result.status == LoginStatus.success) {
      // you are logged
      final AccessToken accessToken = result.accessToken!;
      debugPrint("Logged in. Token: $accessToken");

      setUserLoggedInStatus(true);
      return Future.value(accessToken);
    } else {
      debugPrint("${result.status}");
      debugPrint("${result.message}");
      return Future.error(result);
    }
  }

  Future<dynamic> signInWithGoogle() async {
    final GoogleSignIn _googleSignIn = GoogleSignIn();
    try {
      final _result = await _googleSignIn.signIn();

      setUserLoggedInStatus(true);
      return Future.value(_result);
    } catch (error) {
      print(error);
      return Future.error(error);
    }
  }
}
