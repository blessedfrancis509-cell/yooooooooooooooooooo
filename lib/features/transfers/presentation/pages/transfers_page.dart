import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:zencash_banking/core/theme/app_theme.dart';
import 'package:zencash_banking/features/shared/presentation/widgets/feature_page_scaffold.dart';

class TransfersPage extends StatelessWidget {
  const TransfersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const FeaturePageScaffold(
      title: 'Transfers',
      subtitle: 'Move money instantly',
      icon: Iconsax.convert_3d_cube,
      children: [
        PageSectionTitle('Choose transfer type'),
        GlassSectionCard(
          child: Column(
            children: [
              ActionTile(icon: Iconsax.send_2, title: 'ZenCash to ZenCash', subtitle: 'Free instant transfer'),
              Divider(height: 1),
              ActionTile(icon: Iconsax.bank, title: 'Other bank account', subtitle: 'Send to any Nigerian bank'),
              Divider(height: 1),
              ActionTile(icon: Iconsax.user_add, title: 'Saved beneficiary', subtitle: 'Pay someone from your list'),
            ],
          ),
        ),
        SizedBox(height: 18),
        PageSectionTitle('Recent beneficiaries'),
        _BeneficiaryStrip(),
        SizedBox(height: 18),
        _TransferLimitCard(),
      ],
    );
  }
}

class _BeneficiaryStrip extends StatelessWidget {
  const _BeneficiaryStrip();

  @override
  Widget build(BuildContext context) {
    final beneficiaries = [
      ('AO', 'Ada'),
      ('MK', 'Musa'),
      ('TJ', 'Tomi'),
      ('IB', 'Ife'),
    ];

    return GlassSectionCard(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: beneficiaries
            .map(
              (item) => Column(
                children: [
                  CircleAvatar(
                    radius: 24,
                    backgroundColor: AppTheme.purple.withOpacity(.12),
                    child: Text(item.$1, style: const TextStyle(color: AppTheme.purple, fontWeight: FontWeight.w800)),
                  ),
                  const SizedBox(height: 7),
                  Text(item.$2, style: Theme.of(context).textTheme.labelMedium?.copyWith(fontWeight: FontWeight.w700)),
                ],
              ),
            )
            .toList(),
      ),
    );
  }
}

class _TransferLimitCard extends StatelessWidget {
  const _TransferLimitCard();

  @override
  Widget build(BuildContext context) {
    return GlassSectionCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Daily transfer limit', style: Theme.of(context).textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w800)),
          const SizedBox(height: 8),
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: const LinearProgressIndicator(
              value: .38,
              minHeight: 9,
              backgroundColor: Color(0xFFE4DAEA),
              valueColor: AlwaysStoppedAnimation<Color>(AppTheme.purple),
            ),
          ),
          const SizedBox(height: 8),
          Text('₦380,000 used of ₦1,000,000', style: Theme.of(context).textTheme.labelMedium?.copyWith(color: Colors.black54)),
        ],
      ),
    );
  }
}
