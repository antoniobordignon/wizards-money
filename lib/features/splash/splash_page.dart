import 'dart:async';

import 'package:flutter/material.dart';
import 'package:wizards_money/common/constants/app_collors.dart';
import 'package:wizards_money/common/constants/app_text_styles.dart';
import 'package:wizards_money/common/widgets/custom_circular_progress_indicator.dart';
import 'package:wizards_money/features/onboarding/onboarding_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState(){
    super.initState();
    init();
  }

  Timer init() {
    return Timer(
      const Duration(seconds: 2), 
      navigateToOnboarding
    );
  }

  void navigateToOnboarding() {
    Navigator.pushReplacement(
      context, 
      MaterialPageRoute(
        builder: (context) => const OnboardingPage()
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: AppColors.greenGradient
          )
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Wizard's Money", 
              style: AppTextStyles.bigText.copyWith(color: AppColors.white),
            ),
            const CustomCircularProgressIndicator()
          ],
        ),
      ),
    );
  }
}