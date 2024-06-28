import 'package:flutter/material.dart';
import 'package:task_master/core/utils/custom_colors.dart';

class AuthenticationFormField extends StatelessWidget {
  const AuthenticationFormField({
    super.key,
    required this.nameController,
    required this.label,
  });

  final TextEditingController nameController;
  final String label;

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
          controller: nameController,
          decoration: InputDecoration(
            filled: true,
            fillColor: CustomColors.primaryColor.withAlpha(20),
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
              //  borderSide: BorderSide(width: 0.5, color: CustomColors.primaryColor.withAlpha(100)),
              borderRadius: BorderRadius.circular(20),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(20),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide:
                  BorderSide(width: 0.5, color: CustomColors.primaryColor),
              borderRadius: BorderRadius.circular(20),
            ),
            labelText: label,
          ),
        ),
      ),
    );
  }
}
