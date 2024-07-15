import 'package:flutter/material.dart';
import 'package:wizards_money/common/constants/app_collors.dart';
import 'package:wizards_money/common/constants/app_text_styles.dart';
import 'package:wizards_money/common/constants/routes.dart';
import 'package:wizards_money/common/widgets/mult_text_buttom.dart';
import 'package:wizards_money/common/widgets/primary_button.dart';

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
              child: Image.asset('assets/images/graph.png'),
            ),
            Text('Spend Smarter', 
              style: AppTextStyles.mediumText.copyWith(
                color: AppColors.greenTwo,
              )
            ),
            Text('Save More', 
              style: AppTextStyles.mediumText.copyWith(
                color: AppColors.greenTwo,
              )
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 32.0, 
                right: 32.0,
                top: 16.0,
                bottom: 4.0
              ),
              child: PrimaryButton(
                text: 'Get Started',
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    NamedRoute.signUp
                  );
                },
              ),
            ),
            MultiTextButton(
              onPressed: () => Navigator.pushNamed(context, NamedRoute.signIn),
              children: [
                Text('Already have acount? ', 
                  style: AppTextStyles.smallText.copyWith(
                    color: AppColors.grey,
                  ),
                ),                
                Text('Sign In',
                  style: AppTextStyles.smallText.copyWith(
                    color: AppColors.greenTwo,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24.0),   
          ],
        ),
      ),
    );
  }
}
