import 'package:flutter/material.dart';
import 'package:wizards_money/features/common/constants/app_collors.dart';
import 'package:wizards_money/features/common/constants/app_text_styles.dart';
import 'package:wizards_money/features/common/constants/widgets/primary_button.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.iceWhite,
      body: Align(
        child: Column(
          children: [
            const SizedBox(height: 48.0),
            Expanded(
              flex: 2,
              child: Image.asset('assets/images/graph.png'),
            ),
            Text('Spend Smarter', 
              style: AppTextStyles.mediumText.copyWith(
                color: AppColors.greenlightTwo,
              )
            ),
            Text('Save More', 
              style: AppTextStyles.mediumText.copyWith(
                color: AppColors.greenlightTwo,
              )
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
              child: PrimaryButton(
              text: 'Get Started',
              onPressed: () {

              },
            ),
            ),
            Text('Already have acount? Log In',
              style: AppTextStyles.smallText.copyWith(
                color: AppColors.grey,
              )
            ),
            const SizedBox(height: 24.0),   
          ],
        ),
      ),
    );
  }
}