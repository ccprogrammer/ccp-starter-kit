import 'package:carousel_slider/carousel_slider.dart';
import 'package:ccp_starter/example/themes/example_color.dart';
import 'package:ccp_starter/example/themes/example_textstyle.dart';
import 'package:ccp_starter/example/ui/components/example_image/custom_image_builder.dart';
import 'package:ccp_starter/example/ui/components/example_section/example_custom_section.dart';
import 'package:ccp_starter/example/ui/components/example_wrapper/example_card_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PemiluCarousel extends StatefulWidget {
  const PemiluCarousel({super.key, required this.data});
  final List data;

  @override
  State<PemiluCarousel> createState() => _PemiluCarouselState();
}

class _PemiluCarouselState extends State<PemiluCarousel> {
  int currentIndex = 0;
  CarouselController controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    return ExampleCustomSection(
      title: 'Example Carousel',
      child: CarouselSlider(
        items: widget.data.map((item) {
          return ExampleCardWrapper(
            child: Column(
              children: [
                Expanded(
                  child: ExampleCustomImageBuilder(
                    imageUrl: item['image'],
                    placeHolder: SizedBox(
                      height: 120.h,
                      width: 120.w,
                      child: const Center(
                        child: CircularProgressIndicator(
                          color: colorWhite,
                        ),
                      ),
                    ),
                    errorWidget: SizedBox(
                      height: 120.h,
                      width: 120.w,
                      child: const Icon(
                        Icons.error,
                        color: Colors.white,
                      ),
                    ),
                    child: (imageProvider) => Image(
                      image: imageProvider,
                      width: 120.w,
                      height: 120.h,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        item['name'] ?? '',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: bold,
                          fontSize: 16.sp,
                          color: colorWhite,
                        ),
                        maxLines: 1,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        }).toList(),
        carouselController: controller,
        options: CarouselOptions(
          viewportFraction: 0.6,
          enlargeCenterPage: true,
          height: 200.h,
          onPageChanged: (index, reason) => setState(() {
            currentIndex = index;
          }),
        ),
      ),
    );
  }
}
