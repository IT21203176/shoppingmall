import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shoppingmall/screens/home_screen.dart';
import 'package:shoppingmall/screens/login_screen.dart';
import 'package:shoppingmall/screens/onboarding_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Remove the banner
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        //useMaterial3: true,
      ),
      initialRoute: SplashScreen.id,
      routes: {
        SplashScreen.id:(context)=> const SplashScreen(),
        OnBoardingScreen.id: (context)=> const OnBoardingScreen(),
        HomeScreen.id: (context)=> const HomeScreen(),
        LoginScreen.id: (context)=> const LoginScreen(),
      },
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  static const String id = 'splash-screen';

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    Timer(const Duration(
      seconds: 4
    ), ()=>Navigator.pushReplacementNamed(context, OnBoardingScreen.id),);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge,overlays: []);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Image.asset('assets/images/LOGO11.png'),
      ),
    );
  }
}

