import 'package:ccp_starter/example/routes/example_routes.dart';
import 'package:ccp_starter/example/values/example_insets.dart';
import 'package:ccp_starter/example/values/example_color.dart';
import 'package:ccp_starter/example/ui/components/button/example_button.dart';
import 'package:ccp_starter/example/ui/components/text_field/example_text_field.dart';
import 'package:ccp_starter/example/ui/screen/auth_screen/screen/example_sign_up_screen/controllers/example_sign_un_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ExampleSignUpScreen extends GetView<ExampleSignUpController> {
  const ExampleSignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorBrown,
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
        padding: EdgeInsets.fromLTRB(margin16.w,
            margin24.h, margin16.w, 0),
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
        padding: EdgeInsets.fromLTRB(margin16.w,
            margin24.h, margin16.w, 0),
        child: Column(
          children: [
            ExampleButton(
              marginTop: margin32.h,
              label: 'Log In',
              onTap: () {},
            ),
            ExampleButton(
              marginTop: margin16.h,
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
