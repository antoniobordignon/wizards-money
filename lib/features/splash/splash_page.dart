import 'package:flutter/material.dart';
import 'package:wizards_money/features/common/constants/app_collors.dart';
import 'package:wizards_money/features/common/constants/app_text_styles.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

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
        child: Text("Wizard's Money", 
          style: AppTextStyles.bigText.copyWith(color: AppColors.white),
        ),
      ),
    );
  }
}