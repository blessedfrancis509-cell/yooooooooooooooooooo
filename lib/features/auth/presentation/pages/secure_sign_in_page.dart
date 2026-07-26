import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:iconsax/iconsax.dart';
import 'package:zencash_banking/core/theme/app_theme.dart';
import 'package:zencash_banking/features/home/presentation/pages/home_page.dart';
import 'package:zencash_banking/features/shared/presentation/widgets/animated_bank_button.dart';
import 'package:zencash_banking/features/shared/presentation/widgets/purple_atmosphere.dart';

class SecureSignInPage extends StatelessWidget {
  const SecureSignInPage({super.key});

  static const routeName = '/sign-in';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DecoratedBox(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFF8D20C1), AppTheme.deepPurple, Color(0xFF21002D)],
          ),
        ),
        child: Stack(
          children: [
            const Positioned.fill(child: PurpleAtmosphere()),
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(24, 24, 24, 18),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Spacer(),
                    SvgPicture.asset('assets/svg/zencash_mark.svg', width: 68),
                    const SizedBox(height: 14),
                    Text('Welcome back', style: Theme.of(context).textTheme.headlineMedium?.copyWith(color: Colors.white, fontWeight: FontWeight.w900, letterSpacing: -1)),
                    const SizedBox(height: 6),
                    Text('Unlock your secure ZenCash banking session', textAlign: TextAlign.center, style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.white.withOpacity(.76))),
                    const SizedBox(height: 34),
                    const _PinDots(),
                    const SizedBox(height: 28),
                    const _Keypad(),
                    const Spacer(),
                    AnimatedBankButton(
                      label: 'Sign in securely',
                      icon: Iconsax.security_safe,
                      onTap: () => Navigator.of(context).pushReplacement(MaterialPageRoute<void>(builder: (_) => const HomePage())),
                    ),
                    const SizedBox(height: 14),
                    Text('Protected by device biometrics and bank-grade encryption', textAlign: TextAlign.center, style: Theme.of(context).textTheme.labelMedium?.copyWith(color: Colors.white.withOpacity(.66))),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _PinDots extends StatelessWidget {
  const _PinDots();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        4,
        (index) => Container(
          width: 14,
          height: 14,
          margin: const EdgeInsets.symmetric(horizontal: 8),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: index < 3 ? Colors.white : Colors.white.withOpacity(.20),
            border: Border.all(color: Colors.white.withOpacity(.65)),
          ),
        ),
      ),
    );
  }
}

class _Keypad extends StatelessWidget {
  const _Keypad();

  @override
  Widget build(BuildContext context) {
    final keys = ['1', '2', '3', '4', '5', '6', '7', '8', '9', 'Face ID', '0', '⌫'];
    return GridView.count(
      crossAxisCount: 3,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      mainAxisSpacing: 14,
      crossAxisSpacing: 14,
      childAspectRatio: 1.45,
      children: keys
          .map(
            (key) => Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18),
                color: Colors.white.withOpacity(.10),
                border: Border.all(color: Colors.white.withOpacity(.16)),
              ),
              child: Text(key, style: Theme.of(context).textTheme.titleMedium?.copyWith(color: Colors.white, fontWeight: FontWeight.w800)),
            ),
          )
          .toList(),
    );
  }
}
