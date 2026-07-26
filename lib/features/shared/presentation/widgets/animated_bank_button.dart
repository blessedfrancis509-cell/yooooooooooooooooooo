import 'package:flutter/material.dart';
import 'package:zencash_banking/core/theme/app_theme.dart';
import 'package:zencash_banking/features/home/presentation/widgets/animated_pressable.dart';

class AnimatedBankButton extends StatelessWidget {
  const AnimatedBankButton({required this.label, required this.icon, required this.onTap, super.key});

  final String label;
  final IconData icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return AnimatedPressable(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 56,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
          gradient: const LinearGradient(colors: [Color(0xFF41F37C), Color(0xFF13A047)]),
          boxShadow: [BoxShadow(color: AppTheme.green.withOpacity(.35), blurRadius: 22, offset: const Offset(0, 10))],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: Colors.white, size: 21),
            const SizedBox(width: 9),
            Text(label, style: Theme.of(context).textTheme.titleMedium?.copyWith(color: Colors.white, fontWeight: FontWeight.w900)),
          ],
        ),
      ),
    );
  }
}
