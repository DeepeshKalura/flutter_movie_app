import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_movie_app/firebase_options.dart';
import 'package:flutter_movie_app/main.dart';
import 'package:flutter_movie_app/view/screen/splash/splash_screen.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';

void main() {
  testWidgets('MyApp UI Test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    expect(find.byType(MaterialApp), findsOneWidget);
    expect(find.byType(SplashScreen), findsOneWidget);
  });

  test('Firebase Initialization', () async {
    await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform);

    expect(Firebase.app(), isNotNull);
  });
}
