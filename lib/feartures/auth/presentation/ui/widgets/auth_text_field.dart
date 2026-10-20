
import 'package:bookia_application/core/utls/auth_validator.dart';
import 'package:flutter/material.dart';

class AuthTextField extends StatefulWidget {
  final bool isPassword;
  final TextEditingController? controller;
  final String? hintText;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;

  const AuthTextField({
    super.key,
    this.isPassword = false,
    this.controller,
    this.hintText,
    this.validator,
    this.keyboardType,
  });

  @override
  State<AuthTextField> createState() => _AppTextFormFieldState();
}

class _AppTextFormFieldState extends State<AuthTextField> {
  bool isObscure = true;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 56,
      child: TextFormField(
        controller: widget.controller,
        obscureText: widget.isPassword && isObscure,
        keyboardType: widget.keyboardType ??
            (widget.isPassword
                ? TextInputType.visiblePassword
                : TextInputType.emailAddress),
        validator: widget.validator ??
            (widget.isPassword
                ? AuthValidator.validatePassword
                : AuthValidator.validateEmail),
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          hintText: widget.hintText ??
              (widget.isPassword
                  ? 'Enter your password'
                  : 'Enter your email'),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 16,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide.none,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(
              color: Colors.blue,
              width: 1,
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(
              color: Colors.red,
            ),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(
              color: Colors.red,
              width: 1,
            ),
          ),
          suffixIcon: widget.isPassword
              ? IconButton(
                  onPressed: () {
                    setState(() {
                      isObscure = !isObscure;
                    });
                  },
                  icon: Icon(
                    isObscure
                        ? Icons.visibility_off_outlined
                        : Icons.visibility_outlined,
                  ),
                )
              : null,
        ),
      ),
    );
  }
}
