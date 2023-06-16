import 'package:ccp_starter/example/ui/components/drawer/bindings/example_custom_drawer_binding.dart';
import 'package:ccp_starter/example/ui/screen/auth_screen/example_auth_screen.dart';
import 'package:ccp_starter/example/ui/screen/auth_screen/screen/example_sign_in_screen/bindings/example_sign_in_binding.dart';
import 'package:ccp_starter/example/ui/screen/auth_screen/screen/example_sign_in_screen/example_sign_in_screen.dart';
import 'package:ccp_starter/example/ui/screen/auth_screen/screen/example_sign_up_screen/bindings/example_sign_up_binding.dart';
import 'package:ccp_starter/example/ui/screen/auth_screen/screen/example_sign_up_screen/example_sign_up_screen.dart.dart';
import 'package:ccp_starter/example/ui/screen/init_screen/bindings/example_init_binding.dart';
import 'package:ccp_starter/example/ui/screen/init_screen/example_init_screen.dart';
import 'package:ccp_starter/example/ui/screen/main_screen/bindings/example_main_binding.dart';
import 'package:ccp_starter/example/ui/screen/main_screen/example_main_screen.dart';
import 'package:ccp_starter/example/ui/screen/main_screen/screen/main1/bindings/example_main1_binding.dart';
import 'package:ccp_starter/example/ui/screen/main_screen/screen/main2/bindings/example_main2_binding.dart';
import 'package:ccp_starter/example/ui/screen/onboarding_screen/bindings/example_onboarding_binding.dart';
import 'package:ccp_starter/example/ui/screen/onboarding_screen/example_onboarding_screen.dart';
import 'package:ccp_starter/ui/screen/no_screen.dart';
import 'package:get/get.dart';

abstract class ExampleAppRoutes {
  static const exampleNoScreen = '/';
  static const exampleInit = '/example-init';
  static const exampleOnBoarding = '/example-on-boarding';

  // AUTH
  static const exampleAuth = '/example-auth';
  static const exampleSignIn = '/example-sign-in';
  static const exampleSignUp = '/example-sign-up';

  // MAIN SCREEN
  static const exampleMain = '/example-main';
}

class ExampleGetRoutes {
  static final screen = [
    GetPage(
      name: ExampleAppRoutes.exampleNoScreen,
      page: () => const NoScreen(),
      transition: Transition.noTransition,
    ),
    GetPage(
      name: ExampleAppRoutes.exampleInit,
      page: () => const ExampleInitScreen(),
      transition: Transition.noTransition,
      binding: ExampleInitBinding(),
    ),

    GetPage(
      name: ExampleAppRoutes.exampleOnBoarding,
      page: () => const ExampleOnboardingScreen(),
      transition: Transition.noTransition,
      binding: ExampleOnboardingBinding(),
    ),

    // AUTH
    GetPage(
      name: ExampleAppRoutes.exampleAuth,
      page: () => const ExampleAuthScreen(),
      transition: Transition.noTransition,
    ),
    GetPage(
      name: ExampleAppRoutes.exampleSignIn,
      page: () => const ExampleSignInScreen(),
      transition: Transition.noTransition,
      binding: ExampleSignInBinding(),
    ),
    GetPage(
      name: ExampleAppRoutes.exampleSignUp,
      page: () => const ExampleSignUpScreen(),
      transition: Transition.noTransition,
      binding: ExampleSignUpBinding(),
    ),

    // MAIN
    GetPage(
      name: ExampleAppRoutes.exampleMain,
      page: () => const ExampleMainScreen(),
      transition: Transition.noTransition,
      bindings: [
        ExampleCustomDrawerBinding(),
        ExampleMainBinding(),
        ExampleMain1Binding(),
        ExampleMain2Binding(),
      ],
    ),
  ];
}
