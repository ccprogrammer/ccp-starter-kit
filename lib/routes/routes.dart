import 'package:ccp_starter/example/routes/example_routes.dart' as example;

import 'package:ccp_starter/starter_app.dart';
import 'package:ccp_starter/ui/screen/init_screen/bindings/init_binding.dart';
import 'package:ccp_starter/ui/screen/init_screen/init_screen.dart';
import 'package:ccp_starter/ui/screen/main_screen/bindings/main_binding.dart';
import 'package:ccp_starter/ui/screen/main_screen/main_screen.dart';
import 'package:ccp_starter/ui/screen/no_screen.dart';
import 'package:ccp_starter/ui/screen/onboarding_screen/bindings/onboarding_binding.dart';
import 'package:ccp_starter/ui/screen/onboarding_screen/onboarding_screen.dart';
import 'package:get/get.dart';

abstract class AppRoutes {
  static const noScreen = '/';
  static const starter = '/starter';

  static const init = '/init';
  static const onBoarding = '/on-boarding';
  static const main = '/main';
}

class GetRoutes {
  static final screen = [
    GetPage(
      name: AppRoutes.noScreen,
      page: () => const NoScreen(),
      transition: Transition.noTransition,
    ),
    GetPage(
      name: AppRoutes.starter,
      page: () => const StarterApp(),
      transition: Transition.noTransition,
    ),
    GetPage(
      name: AppRoutes.init,
      page: () => const InitScreen(),
      transition: Transition.noTransition,
      binding: InitBinding(),
    ),

    GetPage(
      name: AppRoutes.onBoarding,
      page: () => const OnboardingScreen(),
      transition: Transition.noTransition,
      binding: OnboardingBinding(),
    ),
    GetPage(
      name: AppRoutes.main,
      page: () => const MainScreen(),
      transition: Transition.noTransition,
      binding: MainBinding(),
    ),

    // EXAMPLE STARTER KIT ROUTES
    ...example.ExampleGetRoutes.screen,
  ];
}
