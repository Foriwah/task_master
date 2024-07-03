import 'package:flutter/material.dart';
import 'package:task_master/core/utils/custom_colors.dart';

class AuthenticationFormField extends StatefulWidget {
  const AuthenticationFormField({
    super.key,
    required this.nameController,
    required this.label,
    this.validator,
    this.onFieldSubmitted,
    this.isPassword = false,
  });

  final TextEditingController nameController;
  final String label;
  final String? Function(String?)? validator;
  final void Function(String)? onFieldSubmitted;
  final bool isPassword;

  @override
  State<AuthenticationFormField> createState() => _AuthenticationFormFieldState();
}

class _AuthenticationFormFieldState extends State<AuthenticationFormField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 16,
      ),
      child: SizedBox(
        height: 56,
        child: TextFormField(
          onFieldSubmitted: widget.onFieldSubmitted,
          validator: widget.validator,
          controller: widget.nameController,
          obscureText: widget.isPassword ? _obscureText : false,
          decoration: InputDecoration(
            filled: true,
            fillColor: CustomColors.primaryColor.withAlpha(20),
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(20),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(20),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  width: 0.5, color: CustomColors.primaryColor),
              borderRadius: BorderRadius.circular(20),
            ),
            labelText: widget.label,
            suffixIcon: widget.isPassword
                ? IconButton(
                    icon: Icon(
                      _obscureText ? Icons.visibility_off : Icons.visibility,
                    ),
                    onPressed: () {
                      setState(() {
                        _obscureText = !_obscureText;
                      });
                    },
                  )
                : null,
          ),
        ),
      ),
    );
  }
}
