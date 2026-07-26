import 'dart:math' as math;
import 'package:flutter/widgets.dart';

class ResponsiveScale extends InheritedWidget {
  const ResponsiveScale({required this.scale, required super.child, super.key});
  final double scale;
  static double of(BuildContext context) => context.dependOnInheritedWidgetOfExactType<ResponsiveScale>()?.scale ?? 1;
  @override
  bool updateShouldNotify(ResponsiveScale oldWidget) => oldWidget.scale != scale;
}

double phoneScaleFor(double width) => math.min(1.12, math.max(.88, width / 390));
