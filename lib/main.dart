import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:task_master/core/utils/custom_colors.dart';
import 'package:task_master/core/utils/fonts.dart';
import 'package:task_master/features/authentication/presentation/pages/sign_up.dart';
import 'package:task_master/firebase_options.dart';

void main() async {
 WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
  options: DefaultFirebaseOptions.currentPlatform,
);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Todo App',
      theme: ThemeData(
        fontFamily: Fonts.urbanist,
        colorScheme: ColorScheme.fromSeed(seedColor: CustomColors.primaryColor),
        useMaterial3: false,
        
      ),
      home:const SignUp() ,
    );
  }
}