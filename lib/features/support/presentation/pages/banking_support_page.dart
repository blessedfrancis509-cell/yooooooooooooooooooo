import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:zencash_banking/core/theme/app_theme.dart';
import 'package:zencash_banking/features/shared/presentation/widgets/feature_page_scaffold.dart';

class BankingSupportPage extends StatelessWidget {
  const BankingSupportPage({super.key});

  static const routeName = '/support';

  @override
  Widget build(BuildContext context) {
    return FeaturePageScaffold(
      title: 'Support',
      subtitle: 'Security, disputes and help desk',
      icon: Iconsax.headphone,
      children: [
        const PageSectionTitle('Urgent banking help'),
        GlassSectionCard(
          child: Column(
            children: [
              ActionTile(
                icon: Iconsax.security_safe,
                title: 'Report fraud or stolen card',
                subtitle: 'Freeze access and contact support immediately',
                trailing: Text('24/7', style: Theme.of(context).textTheme.labelLarge?.copyWith(color: AppTheme.purple, fontWeight: FontWeight.w900)),
              ),
              const Divider(height: 1),
              const ActionTile(icon: Iconsax.message_question, title: 'Dispute a transaction', subtitle: 'Open a card or transfer claim'),
              const Divider(height: 1),
              const ActionTile(icon: Iconsax.call, title: 'Call ZenCash care', subtitle: '+234 800 ZENCASH'),
            ],
          ),
        ),
        const SizedBox(height: 18),
        const PageSectionTitle('Security checklist'),
        const GlassSectionCard(
          child: Column(
            children: [
              ActionTile(icon: Iconsax.finger_scan, title: 'Biometric sign-in', subtitle: 'Enabled on this device'),
              Divider(height: 1),
              ActionTile(icon: Iconsax.lock, title: 'Transaction PIN', subtitle: 'Last changed 15 days ago'),
              Divider(height: 1),
              ActionTile(icon: Iconsax.shield_tick, title: 'Trusted devices', subtitle: '2 active devices'),
            ],
          ),
        ),
      ],
    );
  }
}
