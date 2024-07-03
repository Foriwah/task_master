import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:task_master/core/utils/custom_colors.dart';
import 'package:task_master/core/utils/data_list.dart';
import 'package:task_master/features/authentication/presentation/pages/forgot_password.dart';
import 'package:task_master/features/authentication/presentation/pages/sign_up.dart';
import 'package:task_master/features/authentication/presentation/widgets/auth_button.dart';
import 'package:task_master/features/authentication/presentation/widgets/auth_formfield.dart';
import 'package:task_master/features/todo/presentation/pages/home.dart';

class LogIn extends StatefulWidget {
  const LogIn({super.key});

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  bool formValidation() {
    return formKey.currentState!.validate();
  }

  userlogin() async {
    if (formValidation()) {
      try {
        await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text,
          password: passwordController.text,
        );
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => const Home()));
      } on FirebaseAuthException catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(backgroundColor: Colors.red, content: Text(e.code)));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final cs = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: CustomColors.genericWhite,
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
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
                validator: (value) {
                  if (!emailValid.hasMatch(emailController.text)) {
                    return 'Invalid email';
                  }
                  return null;
                },
                nameController: emailController,
                label: 'Email',
              ),
              AuthenticationFormField(
                isPassword: true,
                validator: (value) {
                  if (value!.length < 6) {
                    return 'Password must be at least 6 characters';
                  }
                  return null;
                },
                nameController: passwordController,
                label: 'Password',
              ),
              AuthButton(
                cs: cs,
                onPressed: () {
                  formValidation();
                  userlogin();
                },
                text: 'Login',
              ),
              
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ForgotPassword(),
                    ),
                  );
                },
                child: Text(
                  'Forgot Password',
                  style: TextStyle(
                    fontSize: 14,
                    color: CustomColors.genericBlack.withAlpha(
                      120,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 12,
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
        ),
      ),
    );
  }
}
