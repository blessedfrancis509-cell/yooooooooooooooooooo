import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class BalanceCard extends StatelessWidget {
  const BalanceCard({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 139,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned.fill(child: CustomPaint(painter: _CardShadowPainter())),
          Positioned.fill(
            child: ClipPath(
              clipper: _BeveledCardClipper(),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Color(0xFFA39BAA),
                        Color(0xFF66557A),
                        Color(0xFF382956),
                        Color(0xFF151125),
                      ],
                      stops: [.02, .28, .62, 1],
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(.48),
                        blurRadius: 24,
                        offset: const Offset(0, 16),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Positioned.fill(child: CustomPaint(painter: _ChromePanelPainter())),
          Positioned.fill(child: CustomPaint(painter: _ReflectionPainter())),
          Align(
            child: Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    '₦2,450.75',
                    style: Theme.of(context).textTheme.displaySmall?.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.w800,
                      height: .98,
                      letterSpacing: -1.6,
                      shadows: const [
                        Shadow(
                          color: Colors.black54,
                          blurRadius: 12,
                          offset: Offset(0, 4),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 7),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'TOTAL NET WORTH',
                        style: Theme.of(context).textTheme.labelMedium?.copyWith(
                          color: Colors.white.withOpacity(.82),
                          fontWeight: FontWeight.w500,
                          letterSpacing: .8,
                        ),
                      ),
                      const SizedBox(width: 7),
                      Icon(Iconsax.eye, size: 15, color: Colors.white.withOpacity(.88)),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _BeveledCardClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size s) {
    return Path()
      ..moveTo(38, 0)
      ..lineTo(s.width - 27, 0)
      ..lineTo(s.width, 23)
      ..lineTo(s.width, s.height - 39)
      ..lineTo(s.width - 34, s.height)
      ..lineTo(34, s.height)
      ..lineTo(0, s.height - 38)
      ..lineTo(0, 32)
      ..close();
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}

class _ChromePanelPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size s) {
    final chrome = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.4
      ..shader = const LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [Color(0xFFD3C4FF), Color(0xFF324DD7), Color(0xFF9A78FF)],
      ).createShader(Offset.zero & s);

    final darkInset = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 5
      ..color = const Color(0xFF20193C).withOpacity(.78);

    final inner = Path()
      ..moveTo(48, 9)
      ..lineTo(s.width - 43, 9)
      ..lineTo(s.width - 12, 31)
      ..lineTo(s.width - 12, s.height - 43)
      ..lineTo(s.width - 45, s.height - 13)
      ..lineTo(45, s.height - 13)
      ..lineTo(12, s.height - 43)
      ..lineTo(12, 35)
      ..close();

    canvas.drawPath(inner, darkInset);
    canvas.drawPath(inner, chrome);

    final capPaint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.2
      ..color = Colors.white.withOpacity(.50);
    canvas.drawLine(const Offset(65, 13), Offset(s.width - 70, 13), capPaint);

    for (final x in [72.0, s.width - 72]) {
      canvas.drawLine(Offset(x, 7), Offset(x - 25, 33), chrome);
      canvas.drawLine(Offset(x - 25, s.height - 34), Offset(x, s.height - 8), chrome);
    }

    final panelPaint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1
      ..color = Colors.white.withOpacity(.18);
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTWH(42, 28, s.width - 84, s.height - 56),
        const Radius.circular(8),
      ),
      panelPaint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class _ReflectionPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size s) {
    final sheen = Paint()
      ..shader = LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [Colors.white.withOpacity(.28), Colors.white.withOpacity(.04), Colors.transparent],
        stops: const [.0, .35, 1],
      ).createShader(Rect.fromLTWH(18, 10, s.width * .52, 54));

    canvas.drawPath(
      Path()
        ..moveTo(24, 16)
        ..lineTo(s.width * .48, 16)
        ..lineTo(s.width * .38, 47)
        ..lineTo(24, 56)
        ..close(),
      sheen,
    );

    canvas.drawOval(
      Rect.fromCenter(
        center: Offset(s.width - 52, s.height - 38),
        width: 82,
        height: 36,
      ),
      Paint()
        ..shader = RadialGradient(
          colors: [Colors.white.withOpacity(.18), Colors.transparent],
        ).createShader(Rect.fromCircle(center: Offset(s.width - 52, s.height - 38), radius: 52)),
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class _CardShadowPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size s) {
    final path = _BeveledCardClipper().getClip(s).shift(const Offset(0, 3));
    canvas.drawPath(
      path,
      Paint()
        ..color = Colors.black.withOpacity(.32)
        ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 18),
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
