import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:shoppingmall/providers/auth_provider.dart';
import 'package:shoppingmall/screens/home_screen.dart';
import 'package:shoppingmall/screens/login_screen.dart';
import 'package:shoppingmall/screens/onboarding_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:shoppingmall/screens/welcome_screen.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_)=>AuthProvider(),
        ),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  //const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.deepPurple
      ),
      home: SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  //const SplashScreen({super.key});

  @override
  void initState() {
    Timer(
      Duration(
        seconds: 3), ()
    {
      FirebaseAuth.instance.authStateChanges().listen((User? user) {
          if(user==null){
            Navigator.pushReplacement(context, MaterialPageRoute(
              builder:(context)=>WelcomeScreen(),
            ));
          }else{
            Navigator.pushReplacement(context, MaterialPageRoute(
              builder:(context)=>HomeScreen(),
            ));
          }
        } );
    }
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Hero(
            tag: 'logo',

            child: Image.asset('assets/images/LOGO11.png')),
      ),
    );
  }
}



