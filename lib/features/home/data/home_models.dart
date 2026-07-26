import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class QuickAction {
  const QuickAction(this.label, this.icon, this.highlight);
  final String label;
  final IconData icon;
  final bool highlight;
}

class ServiceAccount {
  const ServiceAccount({
    required this.title,
    required this.subtitle,
    required this.trailing,
    this.asset,
    this.icon,
    this.routeName,
  });

  final String title;
  final String subtitle;
  final String trailing;
  final String? asset;
  final IconData? icon;
  final String? routeName;
}

const quickActions = [
  QuickAction('Send', Iconsax.arrow_right_3, true),
  QuickAction('Request', Iconsax.arrow_right_1, false),
  QuickAction('Scan QR', Iconsax.scan_barcode, false),
  QuickAction('Pay Bills', Iconsax.receipt_text, false),
];

const services = [
  ServiceAccount(title: 'Zenith Accounts', subtitle: 'Checking\nSavings', trailing: '₦2,450.75\n₦2,450.00', asset: 'assets/svg/zenith_logo.svg', routeName: '/accounts'),
  ServiceAccount(title: 'Zenith Cards', subtitle: 'Linked debit cards', trailing: 'Debit Card', asset: 'assets/svg/debit_card.svg'),
  ServiceAccount(title: 'Investments', subtitle: '', trailing: '', icon: Iconsax.chart_2),
  ServiceAccount(title: 'Business Banking', subtitle: '', trailing: '', icon: Iconsax.briefcase),
];

const navItems = [
  ('Home', Iconsax.home_15),
  ('Transfers', Iconsax.convert_3d_cube),
  ('Payments', Iconsax.money_recive),
  ('Cards', Iconsax.card),
  ('Investments', Iconsax.chart),
];
