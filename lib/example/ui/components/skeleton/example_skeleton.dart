import 'package:ccp_starter/example/values/example_color.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ExampleSkeleton extends StatelessWidget {
  const ExampleSkeleton({
    Key? key,
    this.height,
    this.width,
    this.radius,
    this.marginLeft,
    this.marginTop,
    this.marginRight,
    this.marginBottom,
    this.radiusTop,
    this.radiusBottom,
    this.child,
    this.altColor = false,
    this.isShimmer = true,
  }) : super(key: key);

  final double? height,
      width,
      radius,
      radiusTop,
      radiusBottom,
      marginLeft,
      marginTop,
      marginRight,
      marginBottom;

  final dynamic child;
  final bool altColor;
  final bool isShimmer;

  @override
  Widget build(BuildContext context) {
    if (isShimmer) {
      return Shimmer.fromColors(
        baseColor: altColor ? colorBrown : colorLightBrown,
        highlightColor: Colors.grey[800]!,
        child: Container(
          height: height,
          width: width,
          clipBehavior: Clip.antiAlias,
          margin: EdgeInsets.fromLTRB(marginLeft ?? 0, marginTop ?? 0,
              marginRight ?? 0, marginBottom ?? 0),
          decoration: BoxDecoration(
            color: altColor ? colorBrown : colorLightBrown,
            borderRadius: radius != null
                ? BorderRadius.all(
                    Radius.circular(radius ?? 0),
                  )
                : BorderRadius.vertical(
                    bottom: Radius.circular(radiusBottom ?? 0),
                    top: Radius.circular(radiusTop ?? 0),
                  ),
          ),
          child: child,
        ),
      );
    }

    return Container(
      height: height,
      width: width,
      clipBehavior: Clip.antiAlias,
      margin: EdgeInsets.fromLTRB(
          marginLeft ?? 0, marginTop ?? 0, marginRight ?? 0, marginBottom ?? 0),
      decoration: BoxDecoration(
        color: altColor ? colorBrown : colorLightBrown,
        borderRadius: radius != null
            ? BorderRadius.all(
                Radius.circular(radius ?? 0),
              )
            : BorderRadius.vertical(
                bottom: Radius.circular(radiusBottom ?? 0),
                top: Radius.circular(radiusTop ?? 0),
              ),
      ),
      child: child,
    );
  }
}

class CircleSkeleton extends StatelessWidget {
  const CircleSkeleton(
      {Key? key,
      this.size = 24,
      this.marginLeft,
      this.marginTop,
      this.marginRight,
      this.marginBottom,
      this.child,
      this.altColor = false})
      : super(key: key);

  final double? size, marginLeft, marginTop, marginRight, marginBottom;
  final dynamic child;
  final bool altColor;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: altColor ? colorBrown : colorLightBrown,
      highlightColor: Colors.grey[800]!,
      child: Container(
        height: size,
        width: size,
        margin: EdgeInsets.fromLTRB(marginLeft ?? 0, marginTop ?? 0,
            marginRight ?? 0, marginBottom ?? 0),
        decoration: BoxDecoration(
          color: altColor ? colorBrown : colorDarkGrey,
          shape: BoxShape.circle,
        ),
        child: child,
      ),
    );
  }
}
