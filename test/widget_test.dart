import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:from_feedback_app_new/main.dart';
import 'package:from_feedback_app_new/pages/feedback_form_page.dart';

void main() {
  testWidgets('HomePage shows Feedback button and Counter Demo button', (WidgetTester tester) async {
    // Jalankan app
    await tester.pumpWidget(const MyApp());

    // Cek tombol Feedback ada
    expect(find.text('Feedback'), findsWidgets);

    // Cek tombol Counter Demo ada
    expect(find.text('Counter Demo'), findsWidgets);
  });

  testWidgets('FeedbackFormPage has title and submit button', (WidgetTester tester) async {
    // Jalankan halaman FeedbackFormPage
    await tester.pumpWidget(
      const MaterialApp(home: FeedbackFormPage()),
    );

    // Cek AppBar title
    expect(find.text('Feedback Form'), findsOneWidget);

    // Cek tombol Submit ada
    expect(find.text('Submit'), findsOneWidget);
  });
}
