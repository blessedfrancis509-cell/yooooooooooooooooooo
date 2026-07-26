import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:iconsax/iconsax.dart';
import 'package:zencash_banking/core/theme/app_theme.dart';
import 'package:zencash_banking/features/home/data/home_models.dart';

import 'animated_pressable.dart';

class AppHeader extends StatelessWidget {
  const AppHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(13, 7, 14, 11),
      child: Row(
        children: [
          SvgPicture.asset('assets/svg/zencash_mark.svg', width: 37),
          const SizedBox(width: 7),
          Text(
            'ZenCash',
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.w600,
              letterSpacing: -.35,
            ),
          ),
          const Spacer(),
          for (final item in [
            (Iconsax.search_normal_1, null),
            (Iconsax.notification, '/support'),
            (Iconsax.profile_circle, '/sign-in'),
          ])
            Padding(
              padding: const EdgeInsets.only(left: 17),
              child: AnimatedPressable(
                onTap: item.$2 == null ? null : () => Navigator.of(context).pushNamed(item.$2!),
                child: Icon(item.$1, color: Colors.white, size: 23),
              ),
            ),
        ],
      ),
    );
  }
}

class QuickActionsRow extends StatelessWidget {
  const QuickActionsRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: quickActions.map((action) => _QuickActionButton(action: action)).toList(),
      ),
    );
  }
}

class _QuickActionButton extends StatelessWidget {
  const _QuickActionButton({required this.action});

  final QuickAction action;

  @override
  Widget build(BuildContext context) {
    return AnimatedPressable(
      child: SizedBox(
        width: 72,
        child: Column(
          children: [
            Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: action.highlight
                    ? const LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [Color(0xFF41F37C), Color(0xFF13A047)],
                      )
                    : RadialGradient(
                        colors: [Colors.white.withOpacity(.11), Colors.white.withOpacity(.02)],
                      ),
                boxShadow: action.highlight
                    ? [
                        BoxShadow(
                          color: AppTheme.green.withOpacity(.65),
                          blurRadius: 20,
                          spreadRadius: 2,
                        ),
                      ]
                    : [
                        BoxShadow(
                          color: Colors.black.withOpacity(.16),
                          blurRadius: 13,
                          offset: const Offset(0, 7),
                        ),
                      ],
              ),
              child: Icon(action.icon, color: Colors.white, size: 23),
            ),
            const SizedBox(height: 8),
            Text(
              action.label,
              maxLines: 1,
              style: Theme.of(context).textTheme.labelMedium?.copyWith(
                color: Colors.white,
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ServicesPanel extends StatelessWidget {
  const ServicesPanel({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(18, 18, 18, 8),
      decoration: const BoxDecoration(
        color: Color(0xFFF7F6F8),
        borderRadius: BorderRadius.vertical(top: Radius.circular(23)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'My Accounts & Services',
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
              fontSize: 16,
              fontWeight: FontWeight.w800,
              letterSpacing: -.35,
            ),
          ),
          const SizedBox(height: 10),
          ...services.map(
            (service) => Padding(
              padding: const EdgeInsets.only(bottom: 9),
              child: ServiceCard(service: service),
            ),
          ),
        ],
      ),
    );
  }
}

class ServiceCard extends StatelessWidget {
  const ServiceCard({required this.service, super.key});

  final ServiceAccount service;

  @override
  Widget build(BuildContext context) {
    final isAccount = service.subtitle.contains('\n');

    return AnimatedPressable(
      onTap: service.routeName == null ? null : () => Navigator.of(context).pushNamed(service.routeName!),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 18, sigmaY: 18),
          child: Container(
            minHeight: isAccount ? 84 : 54,
            padding: const EdgeInsets.fromLTRB(12, 9, 9, 8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Colors.white.withOpacity(.93),
                  const Color(0xFFEAE2F2).withOpacity(.82),
                  Colors.white.withOpacity(.72),
                ],
              ),
              border: Border.all(color: Colors.white.withOpacity(.95)),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(.08),
                  blurRadius: 16,
                  offset: const Offset(0, 8),
                ),
                const BoxShadow(color: Colors.white, blurRadius: 3, offset: Offset(-1, -1)),
              ],
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 28,
                  height: 28,
                  child: service.asset != null
                      ? SvgPicture.asset(service.asset!, fit: BoxFit.contain)
                      : Icon(service.icon, color: AppTheme.purple, size: 23),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        service.title,
                        style: Theme.of(context).textTheme.labelLarge?.copyWith(
                          fontWeight: FontWeight.w800,
                          letterSpacing: -.15,
                        ),
                      ),
                      if (service.subtitle.isNotEmpty)
                        Padding(
                          padding: const EdgeInsets.only(top: 8),
                          child: Text(
                            service.subtitle,
                            style: Theme.of(context).textTheme.labelMedium?.copyWith(
                              height: 1.55,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
                if (service.trailing.isNotEmpty)
                  Padding(
                    padding: EdgeInsets.only(top: isAccount ? 31 : 28),
                    child: Text(
                      service.trailing,
                      textAlign: TextAlign.right,
                      style: Theme.of(context).textTheme.labelMedium?.copyWith(
                        height: 1.45,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                const SizedBox(width: 8),
                const Padding(
                  padding: EdgeInsets.only(top: 1),
                  child: Icon(Icons.chevron_right, size: 21, color: Color(0xFF7F668A)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ZenBottomNav extends StatelessWidget {
  const ZenBottomNav({
    required this.currentIndex,
    required this.onTap,
    super.key,
  });

  final int currentIndex;
  final ValueChanged<int> onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 66,
      padding: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.08),
            blurRadius: 18,
            offset: const Offset(0, -4),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          for (var i = 0; i < navItems.length; i++)
            Expanded(
              child: AnimatedPressable(
                onTap: () => onTap(i),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      navItems[i].$2,
                      color: i == currentIndex ? AppTheme.purple : AppTheme.ink,
                      size: 22,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      navItems[i].$1,
                      maxLines: 1,
                      style: Theme.of(context).textTheme.labelSmall?.copyWith(
                        fontSize: 10.2,
                        color: i == currentIndex ? AppTheme.purple : AppTheme.ink,
                        fontWeight: FontWeight.w700,
                        letterSpacing: -.2,
                      ),
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
