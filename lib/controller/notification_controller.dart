import 'package:flutter/foundation.dart';
import 'package:flutter_mobile_template/constraints/configs.dart';
import 'package:get/get.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';

class PushNotificationController extends GetxController {
  PushNotificationController() {
    init();
  }

  String? _userId;

  void init() {
    OneSignal.shared.setLogLevel(OSLogLevel.info, OSLogLevel.none);

    OneSignal.shared.setAppId(AppConfig().oneSignalAppId);

    // The promptForPushNotificationsWithUserResponse function will show the iOS push notification prompt. We recommend removing the following code and instead using an In-App Message to prompt for notification permission
    OneSignal.shared.promptUserForPushNotificationPermission().then((accepted) {
      debugPrint("[ONE_SIGNAL] iOS Accepted permission: $accepted");
    });

    OneSignal.shared.setNotificationWillShowInForegroundHandler((
      OSNotificationReceivedEvent event,
    ) {
      // Will be called whenever a notification is received in foreground
      // Display Notification, pass null param for not displaying the notification
      event.complete(event.notification);
    });

    OneSignal.shared.setNotificationOpenedHandler((
      OSNotificationOpenedResult result,
    ) {
      // Will be called whenever a notification is opened/button pressed.
      // result.notification.rawPayload;
      debugPrint('[ONE_SIGNAL] Notification pressed');

      // Get.to(() => NotificationScreen());
    });

    OneSignal.shared.setPermissionObserver((
      OSPermissionStateChanges changes,
    ) {
      // Will be called whenever the permission changes
      // (ie. user taps Allow on the permission prompt in iOS)
    });

    OneSignal.shared.setSubscriptionObserver((
      OSSubscriptionStateChanges changes,
    ) {
      // Will be called whenever the subscription changes
      // (ie. user gets registered with OneSignal and gets a user ID)
      _userId = changes.to.userId;
    });
  }

  static void setExternalUserId(String externalUserId) {
    OneSignal.shared.setExternalUserId(externalUserId);
  }

  static void setEmailAddress(String emailAddress) {
    OneSignal.shared.setEmail(email: emailAddress);
  }

  static Future<dynamic> setCustomDataTag(String key, String value) async {
    return await OneSignal.shared.sendTag(key, value);
  }

  Future<void> sendPushNotification() async {
    // var response = await OneSignal.shared.postNotificationWithJson({
    //   "include_player_ids": [_userId],
    //   "contents": {"en": "test notification"}
    // });

    await OneSignal.shared.postNotification(
      OSCreateNotification(
        playerIds: ["$_userId"],
        content: "this is a test from OneSignal's Flutter SDK",
        heading: "Test Notification",
        additionalData: {'test': 'value'},
        buttons: [
          OSActionButton(text: "test1", id: "id1"),
          OSActionButton(text: "test2", id: "id2")
        ],
      ),
    );

    // for more details: https://documentation.onesignal.com/v7.0/docs/flutter-sdk-200#postnotification
  }
}
