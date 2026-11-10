import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:stateless_lab_exam/main.dart';

void main() {
  testWidgets('Cart shows products and correct payment summary',
      (tester) async {
    await tester.pumpWidget(const CampusStoreApp());
    expect(find.text('My Cart'), findsOneWidget);
    for (final name in ['Wireless Mouse', 'USB-C Hub', 'Laptop Stand']) {
      expect(find.text(name), findsOneWidget);
    }
    expect(find.text('3 items'), findsOneWidget);
    await tester.ensureVisible(find.text('Place Order'));
    for (final amount in [
      'PHP 2,000.00',
      '\u2212 PHP 200.00',
      'PHP 50.00',
      'PHP 1,850.00'
    ]) {
      expect(find.text(amount), findsOneWidget);
    }
    expect(tester.takeException(), isNull);
  });

  testWidgets('All 13 actions log messages and preserve the static cart',
      (tester) async {
    final messages = <String>[];
    final originalDebugPrint = debugPrint;
    debugPrint = (String? message, {int? wrapWidth}) {
      if (message != null) messages.add(message);
    };
    addTearDown(() => debugPrint = originalDebugPrint);
    await tester.pumpWidget(const CampusStoreApp());
    await tester.tap(find.byTooltip('Back'));
    await tester.tap(find.byTooltip('Shopping bag'));
    await tester.tap(find.text('Change'));
    const names = ['Wireless Mouse', 'USB-C Hub', 'Laptop Stand'];
    for (var i = 0; i < names.length; i++) {
      for (final icon in [Icons.remove, Icons.add]) {
        final button = find.widgetWithIcon(OutlinedButton, icon).at(i);
        await tester.ensureVisible(button);
        await tester.tap(button);
      }
      final remove = find.byTooltip('Remove ${names[i]}');
      await tester.ensureVisible(remove);
      await tester.tap(remove);
    }
    await tester.ensureVisible(find.text('Place Order'));
    await tester.tap(find.text('Place Order'));
    await tester.pump();
    debugPrint = originalDebugPrint;
    expect(messages, [
      'Back clicked',
      'Cart clicked',
      'Change delivery address clicked',
      for (final name in names) ...[
        'Decrease quantity: $name',
        'Increase quantity: $name',
        'Remove item: $name',
      ],
      'Place order clicked! Total: PHP 1850.00',
    ]);
    expect(find.text('3 items'), findsOneWidget);
    expect(find.text('1'), findsNWidgets(3));
    expect(find.text('PHP 1,850.00'), findsOneWidget);
    expect(tester.takeException(), isNull);
  });

  for (final scale in [1.0, 2.0]) {
    testWidgets('Cart fits narrow screen at text scale $scale', (tester) async {
      tester.view.physicalSize = const Size(320, 640);
      tester.view.devicePixelRatio = 1;
      tester.platformDispatcher.textScaleFactorTestValue = scale;
      addTearDown(tester.view.resetPhysicalSize);
      addTearDown(tester.view.resetDevicePixelRatio);
      addTearDown(tester.platformDispatcher.clearTextScaleFactorTestValue);
      await tester.pumpWidget(const CampusStoreApp());
      await tester.ensureVisible(find.text('Place Order'));
      expect(tester.takeException(), isNull);
    });
  }
}
