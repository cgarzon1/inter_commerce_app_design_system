import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:inter_commerce_app_design_system/inter_commerce_app_design_system.dart';

void main() {
  testWidgets('InterCommerceTheme builds light and dark ThemeData', (tester) async {
    expect(InterCommerceTheme.light().brightness, Brightness.light);
    expect(InterCommerceTheme.dark().brightness, Brightness.dark);
  });

  testWidgets('InterCommerceButton renders label and responds to taps', (tester) async {
    var tapped = false;
    await tester.pumpWidget(
      MaterialApp(
        theme: InterCommerceTheme.light(),
        home: Scaffold(
          body: InterCommerceButton(
            label: 'Agregar al carrito',
            onPressed: () => tapped = true,
          ),
        ),
      ),
    );

    expect(find.text('Agregar al carrito'), findsOneWidget);
    await tester.tap(find.byType(InterCommerceButton));
    await tester.pump();
    expect(tapped, isTrue);
  });

  testWidgets('InterCommerceButton falls back to label with no state copy', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        theme: InterCommerceTheme.light(),
        home: Scaffold(
          body: InterCommerceButton(
            label: 'Add to bag',
            state: InterCommerceButtonState.success,
            onPressed: () {},
          ),
        ),
      ),
    );

    expect(find.text('Add to bag'), findsOneWidget);
  });

  testWidgets('InterCommerceButton shows caller-supplied pending/success copy', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        theme: InterCommerceTheme.light(),
        home: Scaffold(
          body: InterCommerceButton(
            label: 'Add to bag',
            successLabel: 'Added ✓',
            state: InterCommerceButtonState.success,
            onPressed: () {},
          ),
        ),
      ),
    );

    expect(find.text('Added ✓'), findsOneWidget);
  });

  testWidgets('InterCommercePriceText formats amount with grouping', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        theme: InterCommerceTheme.light(),
        home: const Scaffold(body: InterCommercePriceText(2480)),
      ),
    );

    expect(find.text(r'$2,480'), findsOneWidget);
  });

  testWidgets('InterCommerceQuantityStepper clamps at minQuantity', (tester) async {
    var quantity = 1;
    await tester.pumpWidget(
      MaterialApp(
        theme: InterCommerceTheme.light(),
        home: Scaffold(
          body: StatefulBuilder(
            builder: (context, setState) => InterCommerceQuantityStepper(
              quantity: quantity,
              onChanged: (value) => setState(() => quantity = value),
            ),
          ),
        ),
      ),
    );

    await tester.tap(find.byIcon(Icons.remove));
    await tester.pump();
    expect(quantity, 1);
  });
}
