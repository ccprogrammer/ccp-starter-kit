import 'package:ccp_starter/example/themes/example_color.dart';
import 'package:flutter/material.dart';

import 'package:pull_to_refresh/pull_to_refresh.dart';

class CustomRefresher extends StatelessWidget {
  const CustomRefresher({
    Key? key,
    required this.child,
    required this.onRefresh,
    required this.onLoading,
    required this.controller,
  }) : super(key: key);
  final Widget child;
  final Function() onRefresh;
  final Function() onLoading;
  final RefreshController controller;

  @override
  Widget build(BuildContext context) {
    return SmartRefresher(
      enablePullDown: true,
      enablePullUp: false,
      controller: controller,
      onRefresh: onRefresh,
      onLoading: onLoading,
      header: const MaterialClassicHeader(
        backgroundColor: colorBrown,
        color: colorBlue,
        distance: kToolbarHeight * 2.2,
      ),
      child: child,
    );
  }
}
