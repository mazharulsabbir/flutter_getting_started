## 1 Configuration

### 1.1 [Setup and Configure OneSignal Flutter SDK](https://documentation.onesignal.com/docs/flutter-sdk-setup)
Add the following to your `lib/constraints/configs.dart` file:`:
```dart
class AppConfig {
  final String _oneSignalAppId = "YOUR_ONESIGNAL_APP_ID";
  final String _oneSignalRestAPIKey = "YOUR_ONESIGNAL_REST_API_KEY";

  String get oneSignalAppId => _oneSignalAppId;
  String get oneSignalRestAPIKey => _oneSignalRestAPIKey;
}
```

### 1.2 [Setup Admob Ads](https://developers.google.com/admob/flutter/quick-start)
#### 1.2.1 Android Configuration
Update `android/app/src/main/AndroidManifest.xml` with the following:
```xml
<manifest>
    <application>
        <!-- Sample AdMob app ID: ca-app-pub-3940256099942544~3347511713 -->
        <meta-data
            android:name="com.google.android.gms.ads.APPLICATION_ID"
            android:value="YOUR_ADMOB_APP_ID"/>
    <application>
<manifest>
```

#### 1.2.2 iOS Configuration
Update `ios/Runner/Info.plist` with the following:
```xml
<dict>
    <!-- Sample AdMob app ID: ca-app-pub-3940256099942544~3347511713 -->
    <key>GADApplicationIdentifier</key>
    <string>YOUR_ADMOB_APP_ID</string>
</dict>
```

### 1.3 [Google Sign-in](https://pub.dev/packages/google_sign_in)
#### 1.3.1 Android Configuration
Update `build.gradle` with the following:
```gradle
buildscript {

  repositories {
    // Check that you have the following line (if not, add it):
    google()  // Google's Maven repository
  }

  dependencies {
    // ...

    // Add the following line:
    classpath 'com.google.gms:google-services:4.3.10'  // Google Services plugin
  }
}

allprojects {
  // ...

  repositories {
    // Check that you have the following line (if not, add it):
    google()  // Google's Maven repository
    // ...
  }
}
```

Update `app/build.gradle` with the following:
```gradle
apply plugin: 'com.android.application'
// Add the following line:
apply plugin: 'com.google.gms.google-services'  // Google Services plugin

android {
  // ...
}
```

#### 1.3.2 iOS Configuration
Update `ios/Runner/Info.plist` with the following:

```xml
<!-- Put me in the [my_project]/ios/Runner/Info.plist file -->
<!-- Google Sign-in Section -->
<key>CFBundleURLTypes</key>
<array>
	<dict>
		<key>CFBundleTypeRole</key>
		<string>Editor</string>
		<key>CFBundleURLSchemes</key>
		<array>
			<!-- TODO Replace this value: -->
			<!-- Copied from GoogleService-Info.plist key REVERSED_CLIENT_ID -->
			<string>com.googleusercontent.apps.861823949799-vc35cprkp249096uujjn0vvnmcvjppkn</string>
		</array>
	</dict>
</array>
<!-- End of the Google Sign-in Section -->
```

### 1.4 [Facebook Sign-in](https://facebook.meedu.app/docs/intro)
