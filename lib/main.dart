import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:funmate/general_controller/general_controller.dart';
import 'package:funmate/modules/signup/view.dart';
import 'package:funmate/utils/colors.dart';
import 'package:get/get.dart';
import 'modules/login/view.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp().then((value) {
    Get.put(GeneralController());
  });

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context , child) {
          return GetMaterialApp(
              debugShowCheckedModeBanner: false,
              home: LoginPage(),
            theme: ThemeData(
              primarySwatch: kCustomBlueColor,
            ),
              builder: (context, child) {
                return MediaQuery(
                  data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
                  child: child!,
                );
              },

          );
        });
  }
}