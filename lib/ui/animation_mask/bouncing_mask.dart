import 'package:flutter/material.dart';

class BouncingMask extends StatefulWidget {
  final Widget child;
  final Duration animationDuration;

  const BouncingMask({
    super.key,
    required this.child,
    this.animationDuration = const Duration(seconds: 2),
  });

  @override
  State<BouncingMask> createState() {
    return _BouncingMaskState();
  }
}

class _BouncingMaskState extends State<BouncingMask>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: widget.animationDuration,
    vsync: this,
  )..forward();
  late final Animation<Offset> _offsetAnimation = Tween<Offset>(
    begin: const Offset(0, -1),
    end: const Offset(0, 0),
  ).animate(CurvedAnimation(
    parent: _controller,
    curve: Curves.bounceOut,
  ));

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      child: widget.child,
      position: _offsetAnimation,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
