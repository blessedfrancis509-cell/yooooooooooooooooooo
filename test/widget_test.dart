import 'package:flutter_test/flutter_test.dart';
import 'package:zencash_banking/app/zencash_app.dart';

void main() {
  testWidgets('renders ZenCash tabs and navigates between app pages', (tester) async {
    await tester.pumpWidget(const ZenCashApp());

    expect(find.text('ZenCash'), findsOneWidget);
    expect(find.text('₦2,450.75'), findsAtLeastNWidgets(1));
    expect(find.text('My Accounts & Services'), findsOneWidget);

    await tester.tap(find.text('Zenith Accounts'));
    await tester.pumpAndSettle();
    expect(find.text('Balances, statements and activity'), findsOneWidget);

    await tester.pageBack();
    await tester.pumpAndSettle();

    await tester.tap(find.text('Transfers').last);
    await tester.pumpAndSettle();
    expect(find.text('Move money instantly'), findsOneWidget);

    await tester.tap(find.text('Payments').last);
    await tester.pumpAndSettle();
    expect(find.text('Bills, airtime and QR payments'), findsOneWidget);

    await tester.tap(find.text('Cards').last);
    await tester.pumpAndSettle();
    expect(find.text('Manage virtual and debit cards'), findsOneWidget);

    await tester.tap(find.text('Investments').last);
    await tester.pumpAndSettle();
    expect(find.text('Grow your portfolio'), findsOneWidget);
  });
}
