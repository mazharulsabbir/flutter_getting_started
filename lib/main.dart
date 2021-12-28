import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobile_template/constraints/strings.dart';
import 'package:flutter_mobile_template/globals/bindings.dart';
import 'package:flutter_mobile_template/screens/splash.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get_storage/get_storage.dart';
import 'package:responsive_framework/responsive_framework.dart';

import 'constraints/themes.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init(dbName);
  await SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp],
  );
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(statusBarColor: Colors.transparent),
  );
  await MobileAds.instance.initialize();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: appName,
      debugShowCheckedModeBanner: false,
      initialBinding: GlobalBindings(),
      home: const Splash(),
      theme: theme(),
      darkTheme: darkTheme(),
      builder: (context, widget) => ResponsiveWrapper.builder(
        BouncingScrollWrapper.builder(context, widget!),
        maxWidth: 1200,
        minWidth: 450,
        defaultScale: true,
        breakpoints: const [
          ResponsiveBreakpoint.resize(
            300,
            name: MOBILE,
            scaleFactor: .90,
          ),
          ResponsiveBreakpoint.resize(
            450,
            name: MOBILE,
          ),
          ResponsiveBreakpoint.autoScale(
            800,
            name: TABLET,
            scaleFactor: 1.10,
          ),
          ResponsiveBreakpoint.autoScale(
            1000,
            name: TABLET,
            scaleFactor: 1.25,
          ),
          ResponsiveBreakpoint.resize(
            1200,
            name: DESKTOP,
            scaleFactor: 1.40,
          ),
        ],
      ),
    );
  }
}
