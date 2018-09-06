// This is a basic Flutter widget test.
// To perform an interaction with a widget in your test, use the WidgetTester utility that Flutter
// provides. For example, you can send tap and scroll gestures. You can also use WidgetTester to
// find child widgets in the widget tree, read text, and verify that the values of widget properties
// are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:app_01/main.dart';

// tests of Flutter
// To run a test in the terminal use:
// flutter test
// flutter run test/widget_test.dart : see in the emulator the interaction made
void main() {
  testWidgets('Clicking tile opens it', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(new MyApp());

    expect(find.byIcon(Icons.launch), findsNothing);

    await tester.tap(find.byType(ExpansionTile).first);
     await tester.pump(); // run very fast
//    await tester.pumpAndSettle(); // wait the whole interaction

    expect(find.byIcon(Icons.launch), findsOneWidget);

  });
}
