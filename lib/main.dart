import 'package:ccp_starter/controllers/auth_controller.dart';
import 'package:ccp_starter/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // SCREEN UTIL
  await ScreenUtil.ensureScreenSize();

  Get.put(AuthController());

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 844),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            fontFamily: '',
          ),

          // change AppRoutes.starter to AppRoutes.init when example route is not needed anymore
          initialRoute: AppRoutes.starter,
          getPages: GetRoutes.screen,
        );
      },
    );
  }
}
