import 'package:cached_network_image/cached_network_image.dart';
import 'package:ccp_starter/example/themes/example_color.dart';
import 'package:ccp_starter/example/ui/components/loading/example_custom_loading.dart';
import 'package:flutter/material.dart';

class ExampleCustomImageBuilder extends StatelessWidget {
  const ExampleCustomImageBuilder(
      {super.key,
      required this.imageUrl,
      required this.child,
      this.placeHolder,
      this.errorWidget});
  final String imageUrl;
  final Function(ImageProvider imageProvider) child;
  final Widget? placeHolder;
  final Widget? errorWidget;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      placeholder: (context, url) =>
          placeHolder ?? const ExampleCustomLoading(),
      errorWidget: (context, url, error) =>
          errorWidget ??
          const Center(
            child: Icon(
              Icons.error,
              color: colorWhite,
            ),
          ),
      imageBuilder: (context, imageProvider) => child(imageProvider),
    );
  }
}
