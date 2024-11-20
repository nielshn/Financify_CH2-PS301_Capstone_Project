import 'package:financify_wallet/ui/pages/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      title: 'Financify',
      debugShowCheckedModeBanner: false,
      home: SplashPage(),
      // routes: {
      //   '/': (context) => const SplashPage(),
      //   '/onboarding': (context) => const OnboardingPage(),
      //   '/sign-in': (context) => const SignInPage(),
      //   '/sign-up': (context) => const SignUpPage(),
      // },
    );
  }
}
