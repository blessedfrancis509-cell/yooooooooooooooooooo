import 'package:flutter/material.dart';
import 'package:zencash_banking/core/theme/app_theme.dart';
import 'package:zencash_banking/features/accounts/presentation/pages/account_details_page.dart';
import 'package:zencash_banking/features/auth/presentation/pages/secure_sign_in_page.dart';
import 'package:zencash_banking/features/home/presentation/pages/home_page.dart';
import 'package:zencash_banking/features/support/presentation/pages/banking_support_page.dart';

class ZenCashApp extends StatelessWidget {
  const ZenCashApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ZenCash',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      home: const HomePage(),
      routes: {
        SecureSignInPage.routeName: (_) => const SecureSignInPage(),
        '/accounts': (_) => const AccountDetailsPage(),
        BankingSupportPage.routeName: (_) => const BankingSupportPage(),
      },
    );
  }
}
