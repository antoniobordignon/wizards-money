import 'package:flutter/material.dart';
import 'package:wizards_money/common/constants/routes.dart';
import 'package:wizards_money/features/Profile/Profile_page.dart';
import 'package:wizards_money/features/home/home_page_view.dart';
import 'package:wizards_money/features/onboarding/onboarding_page.dart';
import 'package:wizards_money/features/sign_in/sign_in_page.dart';
import 'package:wizards_money/features/sign_up/sign_up_page.dart';
import 'package:wizards_money/features/splash/splash_page.dart';
import 'package:wizards_money/features/stats/stats_page.dart';
import 'package:wizards_money/features/wallet/wallet_page.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      initialRoute: NamedRoute.splash,
      routes: {
        NamedRoute.initial: (context) => const OnboardingPage(),
        NamedRoute.splash: (context) => const SplashPage(),
        NamedRoute.signUp: (context) => const SignUpPage(),
        NamedRoute.signIn: (context) => const SignInPage(),
        NamedRoute.home: (context) => const HomePageView(),
        NamedRoute.stats: (context) => const StatsPage(),
        NamedRoute.wallet: (context) => const WalletPage(),
        NamedRoute.profile: (context) => const ProfilePage(),
      }
    );
  }
}