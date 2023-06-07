
import 'package:ccp_starter/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

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
          // theme: ThemeData(
          //   fontFamily: 'Inter-Tight',
          //   // ignore: deprecated_member_use
          //   androidOverscrollIndicator: AndroidOverscrollIndicator.stretch,
          // ),
          initialRoute: AppRoutes.starter,
          getPages: GetRoutes.screen,
        );
      },
    );
  }
}
