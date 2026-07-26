import 'package:flutter/material.dart';

class AnimatedPressable extends StatefulWidget {
  const AnimatedPressable({required this.child, this.onTap, super.key});
  final Widget child;
  final VoidCallback? onTap;
  @override
  State<AnimatedPressable> createState() => _AnimatedPressableState();
}

class _AnimatedPressableState extends State<AnimatedPressable> {
  bool _pressed = false;
  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: widget.onTap,
        onTapDown: (_) => setState(() => _pressed = true),
        onTapCancel: () => setState(() => _pressed = false),
        onTapUp: (_) => setState(() => _pressed = false),
        child: AnimatedScale(
          duration: const Duration(milliseconds: 130),
          curve: Curves.easeOut,
          scale: _pressed ? .96 : 1,
          child: widget.child,
        ),
      );
}
