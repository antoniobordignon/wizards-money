import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:wizards_money/common/constants/app_collors.dart';
import 'package:wizards_money/common/constants/app_text_styles.dart';
import 'package:wizards_money/common/utils/uppercase_text_formatter.dart';
import 'package:wizards_money/common/utils/validator.dart';
import 'package:wizards_money/common/widgets/custom_bottom_sheet.dart';
import 'package:wizards_money/common/widgets/custom_circular_progress_indicator.dart';
import 'package:wizards_money/common/widgets/custom_text_field.dart';
import 'package:wizards_money/common/widgets/mult_text_buttom.dart';
import 'package:wizards_money/common/widgets/password_form_field.dart';
import 'package:wizards_money/common/widgets/primary_button.dart';
import 'package:wizards_money/features/sign_up/sign_up_controller.dart';
import 'package:wizards_money/features/sign_up/sign_up_state.dart';
import 'package:wizards_money/services/mock_auth_service.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _controller = SignUpController(MockAuthService());

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      if (_controller.state is SignUpLoadingState) {
        showDialog(
          context: context,
          builder: (context) => const CustomCircularProgressIndicator(),
        );
      }
      if (_controller.state is SignUpSuccessState) {
        Navigator.pop(context);
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (BuildContext context) => const Scaffold(
              body: Center(
                child: Text("Nova Tela"),
              )
            )
          )
        );
      }
      if (_controller.state is SignUpErrorState) {
        final error = (_controller.state as SignUpErrorState);
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
        Text('Start Saving',
            textAlign: TextAlign.center,
            style: AppTextStyles.mediumText.copyWith(
              color: AppColors.greenTwo,
            )),
        Text('Your Money!',
            textAlign: TextAlign.center,
            style: AppTextStyles.mediumText.copyWith(
              color: AppColors.greenTwo,
            )),
        Image.asset(
          'assets/images/notesIcon.png',
        ),
        Form(
          key: _formKey,
          child: Column(
            children: [
              CustomTextFormField(
                controller: _nameController,
                labelText: "your name",
                hintText: "JANE DOE",
                inputFormatters: [
                  UpperCaseTextInputFormatter(),
                ],
                validator: Validator.validateName,
              ),
              CustomTextFormField(
                controller: _emailController,
                labelText: "your email",
                hintText: "jane@email.com",
                validator: Validator.validateEmail,
              ),
              PasswordFormField(
                controller: _passwordController,
                labelText: "choose your password",
                hintText: "••••••••",
                validator: Validator.validatePassword,
                helperText:
                    "Must have at least 8 characters, 1 capital letter and 1 number.",
              ),
              PasswordFormField(
                labelText: "confirm your password",
                hintText: "••••••••",
                validator: (value) => Validator.validateConfirmPassword(
                  value,
                  _passwordController.text,
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
              left: 32.0, right: 32.0, top: 16.0, bottom: 4.0),
          child: PrimaryButton(
              text: 'Sign Up',
              onPressed: () {
                final valid = _formKey.currentState != null &&
                    _formKey.currentState!.validate();
                if (valid) {
                  _controller.signUp(
                    name: _nameController.text,
                    email: _emailController.text, 
                    password: _passwordController.text,
                  );
                } else {
                  log("Erro ao logar");
                }
              }),
        ),
        MultiTextButton(
          onPressed: () => log('message'),
          children: [
            Text(
              'Already have acount? ',
              style: AppTextStyles.smallText.copyWith(
                color: AppColors.grey,
              ),
            ),
            Text(
              'Sign In',
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