import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:wizards_money/common/constants/app_collors.dart';
import 'package:wizards_money/common/constants/app_text_styles.dart';

class CustomTextFormField extends StatefulWidget {
  final EdgeInsetsGeometry? padding;
  final String? hintText;
  final TextStyle? hintStyle; 
  final String? labelText;
  final TextCapitalization? textCapitalization;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final int? maxLength;
  final TextInputAction? textInputAction;
  final Widget? suffixIcon;
  final bool? obscureText;
  final List<TextInputFormatter>? inputFormatters;
  final FormFieldValidator<String>? validator;
  final String? helperText;

  const CustomTextFormField({
    super.key, 
    this.padding, 
    this.hintText, 
    this.labelText,
    this.textCapitalization, 
    this.controller,
    this.keyboardType, 
    this.maxLength, 
    this.textInputAction,
    this.suffixIcon, 
    this.obscureText,
    this.inputFormatters, 
    this.validator, 
    this.helperText, 
    this.hintStyle
  });

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  final defaultBorder = const OutlineInputBorder(
    borderSide: BorderSide(
      color: AppColors.greenTwo,
    ), 
  );

  String? _helperText;
  
  @override
  void initState() {
    super.initState();
    _helperText = widget.helperText;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: widget.padding ?? 
        const EdgeInsets.symmetric(
          horizontal: 24.0,
          vertical: 12.0,
        ),
      child: TextFormField(
        onChanged: (value) {
          if(value.isEmpty) {
            setState((){
             _helperText = widget.helperText;
            });
            log("test");
          } else if (value.length  == 1){
            setState(() {
              _helperText = null;
            });
            log("test");
          }
        },
        validator: widget.validator,
        style: AppTextStyles.inputText.copyWith(color: AppColors.greenOne),
        inputFormatters: widget.inputFormatters,
        obscureText: widget.obscureText ?? false,
        textInputAction: widget.textInputAction,       
        maxLength: widget.maxLength,
        keyboardType: widget.keyboardType,
        controller: widget.controller,
        textCapitalization: widget.textCapitalization ?? TextCapitalization.none,
        decoration: InputDecoration(
          errorMaxLines: 6, 
          helperText: _helperText,
          helperMaxLines: 3,
          errorStyle: const TextStyle(color: Colors.red),
          suffixIcon: widget.suffixIcon,
          hintText: widget.hintText,
          hintStyle: widget.hintStyle ?? const TextStyle(color: AppColors.greenOne),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          labelText: widget.labelText?.toUpperCase(),
          labelStyle: AppTextStyles.inputLabelText.copyWith(color: AppColors.grey),
          border: defaultBorder,
          focusedBorder: defaultBorder,
          errorBorder: defaultBorder.copyWith(
            borderSide: const BorderSide(
              color: Colors.red,
            ),
          ),
          focusedErrorBorder: defaultBorder.copyWith(
            borderSide: const BorderSide(
              color: Colors.red,
            ),
          ),
          enabledBorder: defaultBorder,
          disabledBorder: defaultBorder,
        )
      ),
    );
  }
}