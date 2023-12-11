import 'package:flutter/material.dart';

class IconAppearanceMask extends StatefulWidget {
  final Widget icon;
  final Duration animationDuration;

  const IconAppearanceMask({
    super.key,
    required this.icon,
    this.animationDuration = const Duration(seconds: 1),
  });

  @override
  State<IconAppearanceMask> createState() {
    return _IconAppearanceMaskState();
  }
}

class _IconAppearanceMaskState extends State<IconAppearanceMask>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: widget.animationDuration,
    vsync: this,
  )..forward();
  late final Animation<double> _animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.fastOutSlowIn,
  );

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      child: widget.icon,
      scale: _animation,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
