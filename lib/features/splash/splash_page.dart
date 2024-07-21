import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:wizards_money/common/constants/app_collors.dart';
import 'package:wizards_money/common/constants/app_text_styles.dart';
import 'package:wizards_money/common/constants/routes.dart';
import 'package:wizards_money/common/widgets/custom_circular_progress_indicator.dart';
import 'package:wizards_money/features/splash/splash_controller.dart';
import 'package:wizards_money/features/splash/splash_state.dart';
import 'package:wizards_money/locator.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  
  final _splashController = locator.get<SplashController>();
  
  @override
  void initState(){
    super.initState();
    
    _splashController.isUserLogged();
    _splashController.addListener(() {
      if(_splashController.state is SplashSuccessState) {
        Navigator.pushReplacementNamed(context, NamedRoute.home);
      } else {
        Navigator.pushReplacementNamed(context, NamedRoute.initial);
      } 
    });
  }

  @override
  void dispose() {
    _splashController.dispose();
    super.dispose();
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