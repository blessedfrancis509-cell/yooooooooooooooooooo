import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:zencash_banking/core/theme/app_theme.dart';
import 'package:zencash_banking/core/utils/responsive.dart';
import 'package:zencash_banking/features/home/presentation/widgets/balance_card.dart';
import 'package:zencash_banking/features/cards/presentation/pages/cards_page.dart';
import 'package:zencash_banking/features/home/presentation/widgets/home_widgets.dart';
import 'package:zencash_banking/features/investments/presentation/pages/investments_page.dart';
import 'package:zencash_banking/features/payments/presentation/pages/payments_page.dart';
import 'package:zencash_banking/features/shared/presentation/widgets/purple_atmosphere.dart';
import 'package:zencash_banking/features/transfers/presentation/pages/transfers_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var _selectedIndex = 0;

  static const _pages = [
    _HomeDashboard(),
    TransfersPage(),
    PaymentsPage(),
    CardsPage(),
    InvestmentsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final scale = phoneScaleFor(constraints.maxWidth);
        final phoneWidth = math.min(430.0, constraints.maxWidth);

        return ResponsiveScale(
          scale: scale,
          child: Scaffold(
            body: Center(
              child: SizedBox(
                width: phoneWidth,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(
                    constraints.maxWidth > 500 ? 38 : 0,
                  ),
                  child: Column(
                    children: [
                      Expanded(
                        child: IndexedStack(
                          index: _selectedIndex,
                          children: _pages,
                        ),
                      ),
                      ZenBottomNav(
                        currentIndex: _selectedIndex,
                        onTap: (index) => setState(() => _selectedIndex = index),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class _HomeDashboard extends StatefulWidget {
  const _HomeDashboard();

  @override
  State<_HomeDashboard> createState() => _HomeDashboardState();
}

class _HomeDashboardState extends State<_HomeDashboard> with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 950),
  )..forward();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xFF8D20C1),
            Color(0xFF530471),
            AppTheme.deepPurple,
            Color(0xFF21002D),
          ],
          stops: [.0, .22, .56, 1],
        ),
      ),
      child: Stack(
        children: [
          const Positioned.fill(child: PurpleAtmosphere()),
          SafeArea(
            bottom: false,
            child: Column(
              children: [
                FadeSlide(
                  animation: _controller,
                  interval: const Interval(0, .48),
                  child: const AppHeader(),
                ),
                FadeSlide(
                  animation: _controller,
                  interval: const Interval(.06, .62),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: BalanceCard(),
                  ),
                ),
                const SizedBox(height: 12),
                FadeSlide(
                  animation: _controller,
                  interval: const Interval(.14, .74),
                  child: const QuickActionsRow(),
                ),
                const SizedBox(height: 13),
                Expanded(
                  child: FadeSlide(
                    animation: _controller,
                    interval: const Interval(.22, .9),
                    child: const ServicesPanel(),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class FadeSlide extends StatelessWidget {
  const FadeSlide({
    required this.animation,
    required this.interval,
    required this.child,
    super.key,
  });

  final Animation<double> animation;
  final Curve interval;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final curved = CurvedAnimation(parent: animation, curve: interval);

    return FadeTransition(
      opacity: curved,
      child: SlideTransition(
        position: Tween<Offset>(
          begin: const Offset(0, .08),
          end: Offset.zero,
        ).animate(CurvedAnimation(parent: curved, curve: Curves.easeOutCubic)),
        child: child,
      ),
    );
  }
}
