import 'dart:async';
import 'package:ccp_starter/example/themes/example_my_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ExampleTextField extends StatefulWidget {
  const ExampleTextField(
      {Key? key,
      this.hintText = '',
      this.controller,
      this.obscureText = false,
      this.isPhone = false,
      required this.label,
      this.isEnabled = true,
      this.keyboardType = ExampleKeyboardType.text})
      : super(key: key);
  final String hintText;
  final TextEditingController? controller;
  final bool obscureText, isPhone;
  final String label;
  final ExampleKeyboardType keyboardType;
  final bool isEnabled;

  @override
  State<ExampleTextField> createState() => _ExampleTextFieldState();
}

class _ExampleTextFieldState extends State<ExampleTextField> {
  Timer? _debounce;
  bool isObscure = true;
  bool isFocused = false;

  @override
  Widget build(BuildContext context) {
    TextInputType? keyboardType;

    var type = widget.keyboardType;
    if (widget.isPhone) {
      keyboardType = TextInputType.number;
    } else if (type == ExampleKeyboardType.text) {
      keyboardType = TextInputType.text;
    } else if (type == ExampleKeyboardType.number) {
      keyboardType = TextInputType.number;
    } else if (type == ExampleKeyboardType.email) {
      keyboardType = TextInputType.emailAddress;
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.label,
          style: TextStyle(
            color: isFocused
                ? ExampleMyColor.colorBlue
                : ExampleMyColor.colorLightGrey,
            fontSize: 14.sp,
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 5.h),
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                width: 1.w,
                color: isFocused
                    ? ExampleMyColor.colorBlue
                    : ExampleMyColor.colorDarkGrey,
              ),
            ),
          ),
          height: 44.h,
          child: Row(
            children: [
              Expanded(
                child: Focus(
                  onFocusChange: (value) => setState(() {
                    isFocused = value;
                  }),
                  child: TextFormField(
                    controller: widget.controller,
                    obscureText: widget.obscureText ? isObscure : false,
                    keyboardType: keyboardType,
                    style: TextStyle(
                      color: widget.isEnabled
                          ? ExampleMyColor.colorWhite
                          : ExampleMyColor.colorGrey,
                      fontSize: 14.sp,
                    ),
                    decoration: InputDecoration.collapsed(
                      hintStyle: TextStyle(
                        color: ExampleMyColor.colorWhite.withOpacity(0.28),
                        fontSize: 14.sp,
                      ),
                      hintText: widget.hintText,
                      enabled: widget.isEnabled,
                    ),
                    onChanged: (value) {
                      if (_debounce?.isActive ?? false) _debounce!.cancel();
                      _debounce =
                          Timer(const Duration(milliseconds: 800), () {});
                    },
                  ),
                ),
              ),
              widget.obscureText
                  ? GestureDetector(
                      onTap: () {
                        setState(() {
                          isObscure = !isObscure;
                        });
                      },
                      child: Icon(
                        isObscure
                            ? Icons.visibility_off_outlined
                            : Icons.visibility_outlined,
                        color: isFocused
                            ? ExampleMyColor.colorBlue
                            : ExampleMyColor.colorGrey.withOpacity(0.4),
                      ),
                    )
                  : const SizedBox(),
            ],
          ),
        ),
      ],
    );
  }
}

enum ExampleKeyboardType {
  text,
  number,
  email,
}
