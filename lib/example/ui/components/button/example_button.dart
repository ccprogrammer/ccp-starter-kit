import 'package:ccp_starter/example/themes/example_color.dart';
import 'package:ccp_starter/example/ui/components/animation/example_bouncing_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ExampleButton extends StatelessWidget {
  const ExampleButton({
    super.key,
    this.label = '',
    required this.onTap,
    this.shrink = false,
    this.marginLeft = 0,
    this.marginTop = 0,
    this.marginRight = 0,
    this.marginBottom = 0,
    this.bgColor = colorLightBrown,
    this.borderColor = colorLightBrown,
    this.isLoading = false,
    this.textColor = colorWhite,
    this.paddingLeft = 16,
    this.paddingTop = 0,
    this.paddingRight = 16,
    this.paddingBottom = 0,
    this.isDisabled = false,
    this.borderRadius = 999,
    this.child,
  });
  final String label;
  final Widget? child;
  final Function onTap;
  final double marginLeft, marginTop, marginRight, marginBottom;
  final double paddingLeft, paddingTop, paddingRight, paddingBottom;
  final double borderRadius;

  final bool shrink;
  final bool isLoading;
  final bool isDisabled;
  final Color bgColor, borderColor, textColor;

  @override
  Widget build(BuildContext context) {
    Widget buildButton() => ExampleBouncingCard(
          child: Container(
            height: 44.h,
            width: shrink ? null : double.infinity,
            margin: EdgeInsets.fromLTRB(
                marginLeft, marginTop, marginRight, marginBottom),
            decoration: BoxDecoration(
              color: isDisabled ? bgColor.withOpacity(0.4) : bgColor,
              borderRadius: BorderRadius.circular(borderRadius),
              border: Border.all(
                width: 1,
                color: isDisabled ? borderColor.withOpacity(0.4) : borderColor,
              ),
            ),
            clipBehavior: Clip.antiAlias,
            child: isLoading
                ? Center(
                    child: SizedBox(
                      width: 24.w,
                      height: 24.h,
                      child: CircularProgressIndicator(
                        color: colorWhite,
                        strokeWidth: 2.w,
                        backgroundColor: colorGrey,
                      ),
                    ),
                  )
                : ElevatedButton(
                    onPressed: () => isDisabled || isLoading ? null : onTap(),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      padding: EdgeInsets.fromLTRB(
                        paddingLeft,
                        paddingTop,
                        paddingRight,
                        paddingBottom,
                      ),
                      elevation: 0,
                      shadowColor: Colors.transparent,
                    ),
                    child: label != ''
                        ? Text(
                            label,
                            style: TextStyle(
                              fontSize: 16.sp,
                              color: isDisabled
                                  ? textColor.withOpacity(0.4)
                                  : textColor,
                            ),
                          )
                        : child,
                  ),
          ),
        );

    if (shrink) {
      return Center(
        child: buildButton(),
      );
    }
    return buildButton();
  }
}
