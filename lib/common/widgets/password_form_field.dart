import 'package:flutter/material.dart';
import 'package:wizards_money/common/widgets/custom_text_field.dart';


class PasswordFormField extends StatefulWidget {
  final EdgeInsetsGeometry? padding;
  final String? hintText;
  final String? labelText;
  final TextEditingController? controller;
  final Widget? suffixIcon;
  final FormFieldValidator<String>? validator;
  final String? helperText;
  
  const PasswordFormField({
    super.key, 
    this.padding,
    this.controller, 
    this.hintText, 
    this.labelText,
    this.suffixIcon,
    this.validator, 
    this.helperText,
  });

  @override
  State<PasswordFormField> createState() => _PasswordFormFieldState();
}

class _PasswordFormFieldState extends State<PasswordFormField> {
  
  bool isHidden = true;

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      helperText: widget.helperText,
      validator: widget.validator,
      padding: widget.padding,
      hintText: widget.hintText,
      labelText: widget.labelText,
      controller: widget.controller,
      suffixIcon: InkWell( 
        borderRadius: BorderRadius.circular(24),
        onTap: () => {
          setState(() {
          isHidden = !isHidden;
          }),
        },
        child: Icon(isHidden ? Icons.visibility : Icons.visibility_off),
      ),
      obscureText: isHidden,
    );
  }
}