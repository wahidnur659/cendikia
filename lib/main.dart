import 'package:flutter/material.dart';
import 'package:cendikia/pages/onboarding_page.dart';
import 'package:cendikia/pages/splash_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => const SplashPage(),
        '/onboarding': (context) => const onBoarding(),
      },
    );
  }
}
