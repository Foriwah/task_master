import 'package:flutter/material.dart';
import 'package:task_master/core/utils/custom_colors.dart';
import 'package:task_master/features/authentication/presentation/pages/sign_up.dart';
import 'package:task_master/features/authentication/presentation/widgets/auth_button.dart';
import 'package:task_master/features/authentication/presentation/widgets/auth_formfield.dart';

class LogIn extends StatefulWidget {
  const LogIn({super.key});

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final cs = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: CustomColors.genericWhite,
      body: Column(
        children: [
          const SizedBox(height: 80),
          SizedBox(
            width: cs.width,
            child: Image.asset(
              'assets/images/welcome.png',
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          AuthenticationFormField(
            nameController: emailController,
            label: 'Email',
          ),
          AuthenticationFormField(
            nameController: passwordController,
            label: 'Password',
          ),
          AuthButton(
            cs: cs,
            onPressed: () {},
            text: 'Login',
          ),
          const SizedBox(
            height: 8,
          ),
          const Text(
            'or Log In with',
            style: TextStyle(fontSize: 16),
          ),
          const SizedBox(
            height: 16,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: SizedBox(
                  child: Image.asset(
                    'assets/images/google_logo.png',
                  ),
                ),
              ),
              const SizedBox(
                width: 30,
              ),
              SizedBox(
                child: Image.asset(
                  'assets/images/apple_logo.png',
                ),
              )
            ],
          ),
          const SizedBox(
            height: 40,
          ),
          GestureDetector(
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
                  fontSize: 14,
                  color: CustomColors.genericBlack.withAlpha(
                    120,
                  ),
                ),
                children: [
                  TextSpan(
                    text: 'Sign Up',
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
        ],
      ),
    );
  }
}
