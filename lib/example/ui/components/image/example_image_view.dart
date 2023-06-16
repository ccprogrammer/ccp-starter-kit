import 'package:ccp_starter/example/themes/example_color.dart';
import 'package:ccp_starter/example/ui/components/image/custom_image_builder.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

class ExampleImageView extends StatefulWidget {
  const ExampleImageView({super.key, this.data});
  final dynamic data;

  @override
  State<ExampleImageView> createState() => _ExampleImageViewState();
}

class _ExampleImageViewState extends State<ExampleImageView> {
  PhotoViewScaleStateController scaleController =
      PhotoViewScaleStateController();
  PhotoViewController controller = PhotoViewController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorBrown,
      body: OrientationBuilder(builder: (context, orientation) {
        return Hero(
          tag: widget.data,
          child: ExampleCustomImageBuilder(
            imageUrl: widget.data,
            child: (imageProvider) => PhotoView(
              minScale: PhotoViewComputedScale.contained * 1,
              maxScale: PhotoViewComputedScale.covered * 1.8,
              basePosition: Alignment.center,
              loadingBuilder: (context, event) =>
                  const CircularProgressIndicator(
                color: colorWhite,
                strokeWidth: 1.5,
              ),
              customSize: orientation == Orientation.portrait
                  ? MediaQuery.of(context).size
                  : null,
              scaleStateChangedCallback: (value) {},
              controller: controller,
              scaleStateController: scaleController,
              backgroundDecoration:
                  const BoxDecoration(color: colorBrown),
              imageProvider: imageProvider,
            ),
          ),
        );
      }),
    );
  }
}
