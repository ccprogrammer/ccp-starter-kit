import 'package:ccp_starter/example/values/example_color.dart';
import 'package:flutter/material.dart';

class ExampleSwiperIndicator extends StatelessWidget {
  const ExampleSwiperIndicator({
    super.key,
    required this.currentIndex,
    required this.dataLength,
    required this.nextTap,
    required this.previousTap,
    this.showSwiper = true,
  });
  final int currentIndex;
  final int dataLength;
  final Function() nextTap;
  final Function() previousTap;
  final bool showSwiper;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        if (showSwiper)
          Material(
            color: currentIndex == 0
                ? colorBrown
                : colorLightBrown,
            borderRadius: BorderRadius.circular(99),
            clipBehavior: Clip.antiAlias,
            child: IconButton(
              constraints: const BoxConstraints(),
              padding: EdgeInsets.zero,
              onPressed: () {
                previousTap();
              },
              icon: const Icon(
                Icons.chevron_left,
                color: colorWhite,
              ),
            ),
          ),
        const SizedBox(width: 8),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          width: 60,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(99),
            color: colorLightBrown,
          ),
          child: Center(
            child: Text(
              '${currentIndex + 1}/$dataLength',
              style: const TextStyle(
                color: colorWhite,
                fontSize: 13,
              ),
            ),
          ),
        ),
        const SizedBox(width: 8),
        if (showSwiper)
          Material(
            color: currentIndex == dataLength - 1
                ? colorBrown
                : colorLightBrown,
            borderRadius: BorderRadius.circular(99),
            clipBehavior: Clip.antiAlias,
            child: IconButton(
              constraints: const BoxConstraints(),
              padding: EdgeInsets.zero,
              onPressed: () {
                nextTap();
              },
              icon: const Icon(
                Icons.chevron_right,
                color: colorWhite,
              ),
            ),
          ),
      ],
    );
  }
}
