import 'package:ccp_starter/example/routes/example_routes.dart';
import 'package:ccp_starter/example/themes/example_insets.dart';
import 'package:ccp_starter/example/themes/example_my_color.dart';
import 'package:ccp_starter/example/ui/components/example_button/example_button.dart';
import 'package:ccp_starter/example/ui/components/example_text_field/example_text_field.dart';
import 'package:ccp_starter/example/ui/screen/auth_screen/screen/example_sign_in_screen/controllers/example_sign_in_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ExampleSignInScreen extends GetView<ExampleSignInController> {
  const ExampleSignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ExampleMyColor.colorBrown,
      body: buildBody(),
    );
  }

  Widget buildBody() {
    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          buildInputField(),
          buildButton(),
        ],
      ),
    );
  }

  Widget buildInputField() => Padding(
        padding: EdgeInsets.fromLTRB(
          ExampleMyInsets.margin16.w,
          ExampleMyInsets.margin24.h,
          ExampleMyInsets.margin16.w,
          0,
        ),
        child: Column(
          children: [
            ExampleTextField(
              label: 'Email',
              controller: TextEditingController(),
              hintText: 'Masukan email anda',
              keyboardType: ExampleKeyboardType.email,
            ),
            ExampleTextField(
              label: 'Password',
              controller: TextEditingController(),
              hintText: 'Masukan password anda',
              keyboardType: ExampleKeyboardType.text,
              obscureText: true,
            ),
          ],
        ),
      );

  Widget buildButton() => Padding(
        padding: EdgeInsets.fromLTRB(
            ExampleMyInsets.margin16.w,
            ExampleMyInsets.margin24.h,
            ExampleMyInsets.margin16.w,
            0),
        child: Column(
          children: [
            ExampleButton(
              marginTop: ExampleMyInsets.margin32.h,
              label: 'Log In',
              onTap: () {},
            ),
            ExampleButton(
              marginTop: ExampleMyInsets.margin16.h,
              label: 'Register',
              borderColor: Colors.transparent,
              bgColor: Colors.transparent,
              onTap: () {
                Get.toNamed(ExampleAppRoutes.exampleSignUp);
              },
            ),
          ],
        ),
      );
}
