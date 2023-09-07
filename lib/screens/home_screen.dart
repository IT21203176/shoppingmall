import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoppingmall/providers/auth_provider.dart';
import 'package:shoppingmall/screens/welcome_screen.dart';

class HomeScreen extends StatelessWidget {
  //const HomeScreen({super.key});
  //static const String id = 'home-screen';


  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthProvider>(context);
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            auth.error='';

            FirebaseAuth.instance.signOut().then((value) {
              Navigator.push(context, MaterialPageRoute(
                  builder: (context)=>WelcomeScreen(),
              ));
            });
          },
          child: Text('Sign Out'),
        ),
      ),
    );
  }
}
