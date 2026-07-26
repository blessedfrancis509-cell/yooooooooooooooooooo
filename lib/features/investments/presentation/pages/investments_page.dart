import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:zencash_banking/core/theme/app_theme.dart';
import 'package:zencash_banking/features/shared/presentation/widgets/feature_page_scaffold.dart';

class InvestmentsPage extends StatelessWidget {
  const InvestmentsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const FeaturePageScaffold(
      title: 'Investments',
      subtitle: 'Grow your portfolio',
      icon: Iconsax.chart,
      children: [
        _PortfolioSummary(),
        SizedBox(height: 18),
        PageSectionTitle('Investment products'),
        GlassSectionCard(
          child: Column(
            children: [
              ActionTile(icon: Iconsax.chart_2, title: 'Money Market Fund', subtitle: 'Estimated return 13.5% p.a.'),
              Divider(height: 1),
              ActionTile(icon: Iconsax.building_4, title: 'Treasury Bills', subtitle: 'Low risk government-backed bills'),
              Divider(height: 1),
              ActionTile(icon: Iconsax.global, title: 'Global ETFs', subtitle: 'Diversified international exposure'),
            ],
          ),
        ),
      ],
    );
  }
}

class _PortfolioSummary extends StatelessWidget {
  const _PortfolioSummary();

  @override
  Widget build(BuildContext context) {
    return GlassSectionCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Portfolio value', style: Theme.of(context).textTheme.labelLarge?.copyWith(color: Colors.black54, fontWeight: FontWeight.w700)),
          const SizedBox(height: 8),
          Text('₦845,200.00', style: Theme.of(context).textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.w900, letterSpacing: -1)),
          const SizedBox(height: 12),
          Row(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                decoration: BoxDecoration(color: AppTheme.green.withOpacity(.14), borderRadius: BorderRadius.circular(999)),
                child: Text('+₦42,910 this month', style: Theme.of(context).textTheme.labelMedium?.copyWith(color: const Color(0xFF11893A), fontWeight: FontWeight.w800)),
              ),
              const Spacer(),
              const Icon(Iconsax.arrow_up_3, color: Color(0xFF11893A), size: 22),
            ],
          ),
        ],
      ),
    );
  }
}
