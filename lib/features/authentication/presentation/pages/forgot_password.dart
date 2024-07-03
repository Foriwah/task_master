import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:task_master/core/utils/custom_colors.dart';
import 'package:task_master/core/utils/data_list.dart';
import 'package:task_master/features/authentication/presentation/pages/login.dart';
import 'package:task_master/features/authentication/presentation/pages/sign_up.dart';
import 'package:task_master/features/authentication/presentation/widgets/auth_button.dart';
import 'package:task_master/features/authentication/presentation/widgets/auth_formfield.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  TextEditingController emailController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  bool formValidation() {
    return formKey.currentState!.validate();
  }

  resetPassword() async {
    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: emailController.text);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: Colors.green,
          content: Text(
            "Password Reset Email has been sent !",
          ),
        ),
      );
      Navigator.push(context, MaterialPageRoute(builder: (context) => const LogIn()));
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(backgroundColor: Colors.red, content: Text(e.code)));
    }
  }

  @override
  Widget build(BuildContext context) {
    final cs = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(
                context,
              );
            },
            icon: Icon(
              Icons.arrow_back,
              color: CustomColors.genericBlack,
            )),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Text(
              'Forgot Your Password? 🔑',
              style: TextStyle(fontSize: 20),
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Text(
              'Enter the email address associated with your account to reset you password',
              style: TextStyle(
                color: CustomColors.genericBlack.withAlpha(120),
              ),
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          Form(
            key: formKey,
            child: AuthenticationFormField(
              validator: (value) {
                if (!emailValid.hasMatch(emailController.text)) {
                  return 'Invalid email';
                }
                return null;
              },
              nameController: emailController,
              label: 'Email',
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Center(
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SignUp(),
                  ),
                );
              },
              child: RichText(
                text: TextSpan(
                  text: 'Don\'t have an account? ',
                  style: TextStyle(
                    fontFamily: 'Urbanist',
                    fontSize: 14,
                    color: CustomColors.genericBlack.withAlpha(
                      120,
                    ),
                  ),
                  children: [
                    TextSpan(
                      text: 'Create one.',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: CustomColors.genericBlack,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      bottomSheet: AuthButton(
        cs: cs,
        text: 'Submit',
        onPressed: () {
          formValidation();
          resetPassword();
        },
      ),
    );
  }
}
