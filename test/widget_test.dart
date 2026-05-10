import 'package:flutter_test/flutter_test.dart';
import 'package:alera/main.dart';

void main() {
  testWidgets('Full app navigation smoke test', (WidgetTester tester) async {
    // 1. Build our app and trigger a frame.
    await tester.pumpWidget(const AleraApp());

    // 2. Verify Dashboard is the initial screen
    expect(find.text('Dashboard'), findsOneWidget);
    expect(find.text('Welcome back, Alex'), findsOneWidget);

    // 3. Navigate to Appointments
    await tester.tap(find.text('Appointments'));
    await tester.pumpAndSettle();
    expect(find.text('Dr. Sarah Smith'), findsOneWidget);
    expect(find.byTooltip('Book Appointment'), findsOneWidget);

    // 4. Navigate to Messages
    await tester.tap(find.text('Messages'));
    await tester.pumpAndSettle();
    expect(find.text('Dr. Sarah Smith'), findsOneWidget); // Chat tile
    expect(find.text('Your test results are ready for review.'), findsOneWidget);

    // 5. Navigate to Records
    await tester.tap(find.text('Records'));
    await tester.pumpAndSettle();
    expect(find.text('Diagnostics'), findsOneWidget);
    expect(find.text('Blood Chemistry Panel'), findsOneWidget);
  });
}
