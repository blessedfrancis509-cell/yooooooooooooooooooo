import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:zencash_banking/core/theme/app_theme.dart';
import 'package:zencash_banking/features/shared/presentation/widgets/feature_page_scaffold.dart';

class AccountDetailsPage extends StatelessWidget {
  const AccountDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return FeaturePageScaffold(
      title: 'Accounts',
      subtitle: 'Balances, statements and activity',
      icon: Iconsax.wallet_2,
      children: [
        const _AccountBalanceSummary(),
        const SizedBox(height: 18),
        const PageSectionTitle('Recent transactions'),
        const GlassSectionCard(
          child: Column(
            children: [
              ActionTile(icon: Iconsax.arrow_down_2, title: 'Salary Credit', subtitle: 'Jul 24 • Zenith Checking', trailing: _AmountText('+₦850,000.00', true)),
              Divider(height: 1),
              ActionTile(icon: Iconsax.shopping_bag, title: 'Market Square POS', subtitle: 'Jul 23 • Debit card', trailing: _AmountText('-₦18,450.00', false)),
              Divider(height: 1),
              ActionTile(icon: Iconsax.flash, title: 'Electricity Token', subtitle: 'Jul 22 • Bill payment', trailing: _AmountText('-₦32,000.00', false)),
              Divider(height: 1),
              ActionTile(icon: Iconsax.arrow_up_3, title: 'Transfer to Musa', subtitle: 'Jul 21 • Bank transfer', trailing: _AmountText('-₦75,000.00', false)),
            ],
          ),
        ),
        const SizedBox(height: 18),
        const PageSectionTitle('Account services'),
        GlassSectionCard(
          child: Column(
            children: [
              const ActionTile(icon: Iconsax.document_text, title: 'Download statement', subtitle: 'PDF, CSV and email delivery'),
              const Divider(height: 1),
              const ActionTile(icon: Iconsax.receipt, title: 'Proof of account', subtitle: 'Generate official account letter'),
              const Divider(height: 1),
              ActionTile(
                icon: Iconsax.security_safe,
                title: 'Spending controls',
                subtitle: 'Daily limits and transfer approvals',
                trailing: Text('Secure', style: Theme.of(context).textTheme.labelMedium?.copyWith(color: AppTheme.purple, fontWeight: FontWeight.w800)),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _AccountBalanceSummary extends StatelessWidget {
  const _AccountBalanceSummary();

  @override
  Widget build(BuildContext context) {
    return GlassSectionCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text('Zenith Checking', style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w900)),
              const Spacer(),
              const Icon(Iconsax.eye, color: AppTheme.purple, size: 20),
            ],
          ),
          const SizedBox(height: 12),
          Text('Available balance', style: Theme.of(context).textTheme.labelLarge?.copyWith(color: Colors.black54, fontWeight: FontWeight.w700)),
          const SizedBox(height: 6),
          Text('₦2,450.75', style: Theme.of(context).textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.w900, letterSpacing: -1)),
          const SizedBox(height: 14),
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(color: AppTheme.purple.withOpacity(.08), borderRadius: BorderRadius.circular(14)),
            child: Row(
              children: [
                const Icon(Iconsax.bank, color: AppTheme.purple, size: 20),
                const SizedBox(width: 8),
                Text('0123456789', style: Theme.of(context).textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w800)),
                const Spacer(),
                Text('Copy', style: Theme.of(context).textTheme.labelMedium?.copyWith(color: AppTheme.purple, fontWeight: FontWeight.w800)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _AmountText extends StatelessWidget {
  const _AmountText(this.amount, this.credit);

  final String amount;
  final bool credit;

  @override
  Widget build(BuildContext context) {
    return Text(
      amount,
      style: Theme.of(context).textTheme.labelLarge?.copyWith(
        color: credit ? const Color(0xFF11893A) : Colors.black87,
        fontWeight: FontWeight.w900,
      ),
    );
  }
}
