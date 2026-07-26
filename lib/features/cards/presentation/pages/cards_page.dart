import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:zencash_banking/core/theme/app_theme.dart';
import 'package:zencash_banking/features/shared/presentation/widgets/feature_page_scaffold.dart';

class CardsPage extends StatelessWidget {
  const CardsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const FeaturePageScaffold(
      title: 'Cards',
      subtitle: 'Manage virtual and debit cards',
      icon: Iconsax.card,
      children: [
        _VirtualCardPreview(),
        SizedBox(height: 18),
        PageSectionTitle('Card controls'),
        GlassSectionCard(
          child: Column(
            children: [
              ActionTile(icon: Iconsax.card_add, title: 'Create virtual card', subtitle: 'Shop securely online'),
              Divider(height: 1),
              ActionTile(icon: Iconsax.security_safe, title: 'Freeze card', subtitle: 'Temporarily block transactions'),
              Divider(height: 1),
              ActionTile(icon: Iconsax.receipt_text, title: 'Card statements', subtitle: 'Download monthly records'),
            ],
          ),
        ),
      ],
    );
  }
}

class _VirtualCardPreview extends StatelessWidget {
  const _VirtualCardPreview();

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(24),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 18, sigmaY: 18),
        child: Container(
          height: 194,
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
            gradient: const LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Color(0xFF2B063E), Color(0xFF7F1FB4), Color(0xFF141026)],
            ),
            boxShadow: [
              BoxShadow(color: Colors.black.withOpacity(.22), blurRadius: 22, offset: const Offset(0, 12)),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text('Zenith Debit', style: Theme.of(context).textTheme.titleMedium?.copyWith(color: Colors.white, fontWeight: FontWeight.w800)),
                  const Spacer(),
                  const Icon(Iconsax.card, color: Colors.white, size: 28),
                ],
              ),
              const Spacer(),
              Text('••••  ••••  ••••  2408', style: Theme.of(context).textTheme.titleLarge?.copyWith(color: Colors.white, fontWeight: FontWeight.w700, letterSpacing: 1.8)),
              const SizedBox(height: 16),
              Row(
                children: [
                  Text('ADE ZEN', style: Theme.of(context).textTheme.labelLarge?.copyWith(color: Colors.white.withOpacity(.88), fontWeight: FontWeight.w700)),
                  const Spacer(),
                  Text('09/29', style: Theme.of(context).textTheme.labelLarge?.copyWith(color: Colors.white.withOpacity(.88), fontWeight: FontWeight.w700)),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
