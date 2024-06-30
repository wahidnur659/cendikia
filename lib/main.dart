import 'package:cendikia/pages/Home_Page.dart';
import 'package:cendikia/pages/komunitas_page.dart';
import 'package:cendikia/pages/login_page.dart';
import 'package:cendikia/pages/onboarding_page.dart';
import 'package:cendikia/pages/profile_page.dart';
import 'package:cendikia/pages/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
//import 'package:firebase_core/firebase_core.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => SearchProvider(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => const SplashPage(),
        '/onboarding': (context) => const onBoarding(),
        '/loginpage': (context) => const LoginPage(),
        '/homepage': (context) => HomePage(),
        '/komunitas': (context) => ChatScreen(),
        '/profilpage': (context) => AccountScreen(),
      },
    );
  }
}
