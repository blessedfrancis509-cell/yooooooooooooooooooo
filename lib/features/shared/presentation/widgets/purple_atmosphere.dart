import 'package:flutter/material.dart';

class PurpleAtmosphere extends StatelessWidget {
  const PurpleAtmosphere({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _PurpleAtmospherePainter(),
      child: const SizedBox.expand(),
    );
  }
}

class _PurpleAtmospherePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    void glow(Offset center, double radius, Color color) {
      canvas.drawCircle(
        center,
        radius,
        Paint()
          ..shader = RadialGradient(
            colors: [color, color.withOpacity(0)],
          ).createShader(Rect.fromCircle(center: center, radius: radius)),
      );
    }

    glow(Offset(size.width * .06, size.height * .26), 122, const Color(0xFF31D56A).withOpacity(.23));
    glow(Offset(size.width * .94, size.height * .18), 96, const Color(0xFFBE57FF).withOpacity(.22));
    glow(Offset(size.width * .50, size.height * .43), 168, const Color(0xFF150020).withOpacity(.42));
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
