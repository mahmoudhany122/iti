import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iti/login.dart';
import 'package:iti/onboardingscreen.dart';
import 'package:iti/register.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}
// class MyApp
class MyApp extends StatelessWidget
{
  const MyApp({super.key});
  //constructor
  // build
  @override
  Widget build(BuildContext context)
  {
    return MaterialApp(
      debugShowCheckedModeBanner:false,
      home:OnBoardingScreen(),
    );
  }
}

