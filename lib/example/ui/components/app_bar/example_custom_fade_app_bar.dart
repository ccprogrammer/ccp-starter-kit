import 'package:ccp_starter/example/themes/example_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ExampleCustomFadeAppBar extends StatefulWidget
    implements PreferredSizeWidget {
  const ExampleCustomFadeAppBar({
    super.key,
    this.title,
    this.leading,
    this.actionButton,
    this.centerTitle = true,
    this.titleSpacing = 16.0,
    this.withLeading = true,
    this.bottom,
    this.color,
    this.fullOpacity = false,
    required this.child,
  });
  final dynamic title;
  final Widget? leading;
  final List<Widget>? actionButton;
  final bool centerTitle;
  final double titleSpacing;
  final bool withLeading;
  final dynamic bottom;
  final Color? color;
  final bool fullOpacity;
  final Function(ScrollController scrollController) child;

  @override
  State<ExampleCustomFadeAppBar> createState() =>
      _ExampleCustomFadeAppBarState();

  @override
  Size get preferredSize => Size.fromHeight(bottom == null ? 55.h : 110.h);
}

class _ExampleCustomFadeAppBarState extends State<ExampleCustomFadeAppBar> {
  late ScrollController scrollController;
  double visibleCount = 0;
  @override
  void initState() {
    super.initState();

    scrollController = ScrollController();
    scrollController.addListener(scrollListener);
  }

  @override
  void dispose() {
    super.dispose();
    scrollController.dispose();
  }

  scrollListener() {
    double maxHeight = Get.statusBarHeight;
    double offset = scrollController.offset;

    if (offset >= 0 && offset < maxHeight) {
      setState(() {
        visibleCount = offset / maxHeight;
      });
    } else if (offset > maxHeight && visibleCount < 1.0) {
      setState(() {
        visibleCount = 1.0;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      extendBody: true,
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        // systemOverlayStyle: const SystemUiOverlayStyle(
        //   statusBarColor: Colors.transparent, // <-- SEE HERE
        //   statusBarIconBrightness:
        //       Brightness.light, //<-- For Android SEE HERE (dark icons)
        //   statusBarBrightness:
        //       Brightness.light, //<-- For iOS SEE HERE (dark icons)
        // ),
        automaticallyImplyLeading: false,
        backgroundColor: widget.color == null
            ? Colors.transparent
            : widget.color
                ?.withOpacity(widget.fullOpacity ? 1.0 : visibleCount),
        elevation: 0,
        centerTitle: widget.centerTitle,
        titleSpacing: widget.titleSpacing.w,
        leading: widget.withLeading
            ? widget.leading ??
                IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: Icon(Icons.chevron_left, size: 24.w),
                )
            : null,
        title: widget.title is String
            ? Text(
                widget.title,
                style: TextStyle(
                  color: colorWhite,
                  fontSize: 16.sp,
                ),
              )
            : widget.title,
        actions: widget.actionButton ?? [],
        flexibleSpace: widget.color == null
            ? Opacity(
                opacity: widget.fullOpacity ? 1.0 : visibleCount,
                child: Container(
                  decoration: BoxDecoration(
                    gradient: gradientBlue,
                  ),
                ),
              )
            : const SizedBox(),
        bottom: widget.bottom,
      ),
      body: widget.child(scrollController),
    );
  }
}
