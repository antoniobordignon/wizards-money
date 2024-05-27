import 'package:flutter/material.dart';
import 'package:wizards_money/features/splash/splash_page.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: SplashPage()
      // home: Scaffold(
      //   body: Center(child: Text('Home')),
      // ),
    );
  }
}