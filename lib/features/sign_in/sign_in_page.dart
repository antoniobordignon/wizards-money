import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:wizards_money/common/constants/app_collors.dart';
import 'package:wizards_money/common/constants/app_text_styles.dart';
import 'package:wizards_money/common/constants/routes.dart';
import 'package:wizards_money/common/utils/validator.dart';
import 'package:wizards_money/common/widgets/custom_bottom_sheet.dart';
import 'package:wizards_money/common/widgets/custom_circular_progress_indicator.dart';
import 'package:wizards_money/common/widgets/custom_text_field.dart';
import 'package:wizards_money/common/widgets/mult_text_buttom.dart';
import 'package:wizards_money/common/widgets/password_form_field.dart';
import 'package:wizards_money/common/widgets/primary_button.dart';
import 'package:wizards_money/features/sign_in/sign_in_controller.dart';
import 'package:wizards_money/features/sign_in/sign_in_state.dart';
import 'package:wizards_money/locator.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _controller = locator.get<SignInController>();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      if (_controller.state is SignInLoadingState) {
        showDialog(
          context: context,
          builder: (context) => const CustomCircularProgressIndicator(),
        );
      }
      if (_controller.state is SignInSuccessState) {
        Navigator.pop(context);
        Navigator.restorablePushReplacementNamed(context, NamedRoute.home);
      }
      if (_controller.state is SignInErrorState) {
        final error = (_controller.state as SignInErrorState);
        Navigator.pop(context);
        customModalBottomSheet(
          context: context,
          content: error.message,          
          buttonText: "Tentar novamente."
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      children: [
        Text('Welcome Back!',
            textAlign: TextAlign.center,
            style: AppTextStyles.mediumText.copyWith(
              color: AppColors.greenTwo,
            )),
        Image.asset(
          'assets/images/person.png',
        ),
        Form(
          key: _formKey,
          child: Column(
            children: [
              CustomTextFormField(
                controller: _emailController,
                labelText: "your email",
                hintText: "jane@email.com",
                validator: Validator.validateEmail,
              ),
              PasswordFormField(
                controller: _passwordController,
                labelText: "your password",
                hintText: "••••••••",
                validator: Validator.validatePassword,
                helperText:
                    "Must have at least 8 characters, 1 capital letter and 1 number.",
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
              left: 32.0, right: 32.0, top: 16.0, bottom: 4.0),
          child: PrimaryButton(
              text: 'Sign In',
              onPressed: () {
                final valid = _formKey.currentState != null &&
                    _formKey.currentState!.validate();
                if (valid) {
                  _controller.signIn(
                    email: _emailController.text, 
                    password: _passwordController.text,
                  );
                } else {
                  log("Erro ao logar");
                }
              }),
        ),
        MultiTextButton(
          onPressed: () => Navigator.popAndPushNamed(
            context, 
            NamedRoute.signUp,
          ),
          children: [
            Text(
              "Don't have acount? ",
              style: AppTextStyles.smallText.copyWith(
                color: AppColors.grey,
              ),
            ),
            Text(
              'Sign Up',
              style: AppTextStyles.smallText.copyWith(
                color: AppColors.greenTwo,
              ),
            ),
          ],
        ),
      ],
    ));
  }
}