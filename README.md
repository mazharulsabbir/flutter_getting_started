## Configuration

Add the following to your `lib/constraints/configs.dart` file:`:
```dart
class AppConfig {
  final String _oneSignalAppId = "YOUR_ONESIGNAL_APP_ID";
  final String _oneSignalRestAPIKey = "YOUR_ONESIGNAL_REST_API_KEY";

  String get oneSignalAppId => _oneSignalAppId;
  String get oneSignalRestAPIKey => _oneSignalRestAPIKey;
}
```

### [Setup and Configure OneSignal Flutter SDK](https://documentation.onesignal.com/docs/flutter-sdk-setup)
Add the following to the very top (Line:1 ) of your `android/app/build.gradle` file:
```gradle
buildscript {
    repositories {
        // ...
        maven { url 'https://plugins.gradle.org/m2/' } // Gradle Plugin Portal
    }
    dependencies {
        // ...
        // OneSignal-Gradle-Plugin
        classpath 'gradle.plugin.com.onesignal:onesignal-gradle-plugin:[0.12.10, 0.99.99]'
    }
}

apply plugin: 'com.onesignal.androidsdk.onesignal-gradle-plugin'
```

### [Setup Admob Ads](https://developers.google.com/admob/flutter/quick-start)
Update `AndroidManifest.xml` with the following:
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