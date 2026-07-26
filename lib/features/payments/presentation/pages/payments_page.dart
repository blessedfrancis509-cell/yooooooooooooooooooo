import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:zencash_banking/core/theme/app_theme.dart';
import 'package:zencash_banking/features/shared/presentation/widgets/feature_page_scaffold.dart';

class PaymentsPage extends StatelessWidget {
  const PaymentsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return FeaturePageScaffold(
      title: 'Payments',
      subtitle: 'Bills, airtime and QR payments',
      icon: Iconsax.money_recive,
      children: [
        const PageSectionTitle('Popular payments'),
        GridView.count(
          crossAxisCount: 2,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
          childAspectRatio: 1.42,
          children: const [
            _PaymentTile(icon: Iconsax.mobile, title: 'Airtime', subtitle: 'Top up phone'),
            _PaymentTile(icon: Iconsax.wifi, title: 'Data', subtitle: 'Internet bundle'),
            _PaymentTile(icon: Iconsax.flash, title: 'Electricity', subtitle: 'Pay meter bill'),
            _PaymentTile(icon: Iconsax.scan_barcode, title: 'Scan QR', subtitle: 'Merchant payment'),
          ],
        ),
        const SizedBox(height: 18),
        const PageSectionTitle('Upcoming bills'),
        const GlassSectionCard(
          child: Column(
            children: [
              ActionTile(icon: Iconsax.receipt_text, title: 'DSTV Premium', subtitle: 'Due tomorrow • ₦24,500'),
              Divider(height: 1),
              ActionTile(icon: Iconsax.flash_1, title: 'Ikeja Electric', subtitle: 'Auto reminder enabled'),
            ],
          ),
        ),
      ],
    );
  }
}

class _PaymentTile extends StatelessWidget {
  const _PaymentTile({required this.icon, required this.title, required this.subtitle});

  final IconData icon;
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return GlassSectionCard(
      padding: const EdgeInsets.all(14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: AppTheme.purple, size: 25),
          const SizedBox(height: 10),
          Text(title, style: Theme.of(context).textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w800)),
          const SizedBox(height: 3),
          Text(subtitle, style: Theme.of(context).textTheme.labelMedium?.copyWith(color: Colors.black54)),
        ],
      ),
    );
  }
}
