import 'package:flutter/material.dart';
import 'package:wizards_money/features/sign_up/sign_up_page.dart';
import 'package:wizards_money/features/splash/splash_page.dart'; 

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: SplashPage(),
    );
  }
}