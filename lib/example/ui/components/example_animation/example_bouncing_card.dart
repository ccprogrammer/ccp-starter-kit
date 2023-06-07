import 'package:flutter/material.dart';

class ExampleBouncingCard extends StatefulWidget {
  const ExampleBouncingCard({super.key, required this.child});
  final Widget child;

  @override
  State<ExampleBouncingCard> createState() => _ExampleBouncingCardState();
}

class _ExampleBouncingCardState extends State<ExampleBouncingCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 100));
    _animation =
        Tween<double>(begin: 1, end: 0.94).animate(_animationController)
          ..addListener(() {
            setState(() {});
          });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onHover: (event) => _handleBounce(),
      child: GestureDetector(
        // onTapDown: _handleTapDown,
        // onTapUp: _handleTapUp,
        // onTapCancel: _handleTapCancel,
        child: Transform.scale(
          scale: _animation.value,
          child: widget.child,
        ),
      ),
    );
  }

  void _handleBounce() {
    _animationController.forward().then(
          (value) => _animationController.reverse(),
        );
  }

  // void _handleTapDown(TapDownDetails details) {
  //   _animationController.forward();
  // }

  // void _handleTapUp(TapUpDetails details) {
  //   _animationController.reverse();
  // }

  // void _handleTapCancel() {
  //   _animationController.reverse();
  // }
}
