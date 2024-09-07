import 'package:baraka_trans/app/modules/onboarding/controllers/onboarding_controller.dart';
import 'package:baraka_trans/consts/fonts.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'app/routes/app_pages.dart';
import 'firebase_options.dart';

void main() async {
  await GetStorage.init();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  OneSignal.Debug.setLogLevel(OSLogLevel.verbose);
  OneSignal.initialize('c54d6dfe-27f3-4e1c-9251-ca82ef60eeb1');
  OneSignal.Notifications.requestPermission(true);
  final controller = Get.put(OnboardingController());

  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "barakaApp",
      initialRoute: controller.value.value
          ? controller.isSignedIn.value == true
              ? AppPages.HOME
              : AppPages.INITIAL
          : AppPages.ONBOARDING,
      theme: ThemeData(fontFamily: Appfonts.mainFont),
      getPages: AppPages.routes,
      locale: const Locale("ar"),
    ),
  );
}
