import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:task_master/core/utils/custom_colors.dart';
import 'package:task_master/core/utils/data_list.dart';
import 'package:task_master/features/authentication/presentation/pages/login.dart';
import 'package:task_master/features/authentication/presentation/widgets/auth_button.dart';
import 'package:task_master/features/authentication/presentation/widgets/auth_formfield.dart';
import 'package:task_master/features/todo/presentation/pages/home.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();


  final formKey = GlobalKey<FormState>();

  bool formValidation() {
    return formKey.currentState!.validate();
  }

  

  registration() async {
    if(formValidation()) {
      try{
        UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text,
          password: passwordController.text
        ) ;
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(backgroundColor: Colors.green,
          content: Text('Registration Successful'))
        );
        Navigator.push(context, MaterialPageRoute(builder: (context)=> const Home()));
      }
      on FirebaseAuthException catch (e) {
       ScaffoldMessenger.of(context).showSnackBar(
         SnackBar(backgroundColor: Colors.red,content: Text(e.code))
       );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final cs = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: CustomColors.genericWhite,
      body: 
      SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
             
              SizedBox(
                width: cs.width,
                height: cs.height * 0.35,
                child: Image.asset(
                  'assets/images/signup.jpeg',
                  fit: BoxFit.cover,
                ),
              ),
              
              AuthenticationFormField(
              
                validator: (value){
                    if(value == null || value.isEmpty){
                      return 'Please enter your name';
                    }
                    return null;
                },
                nameController: nameController,
                label: 'Name',
              ),
              AuthenticationFormField(
                
                  validator: (value){
                    if(!emailValid.hasMatch(emailController.text)){
                      return 'Invalid email';
                    }
                    return null;
                },
                nameController: emailController,
                label: 'Email',
              ),
              AuthenticationFormField(
               isPassword: true, 
                 validator: (value){
                    if(value!.length < 6){
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
                  registration();
                },
                text: 'Sign Up',
              ),
              const SizedBox(
                height: 4,
              ),
              const Text(
                'or Sign Up with',
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
                height: 20,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LogIn(),
                    ),
                  );
                },
                child: RichText(
                  text: TextSpan(
                    text: 'Already have an account? ',
                    style: TextStyle(
                       fontFamily: 'Urbanist',
                      fontSize: 14,
                      color: CustomColors.genericBlack.withAlpha(
                        120,
                      ),
                    ),
                    children: [
                      TextSpan(
                        text: 'Login',
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
