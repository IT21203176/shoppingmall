import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoppingmall/providers/auth_provider.dart';
import 'package:shoppingmall/screens/chat_bot_app.dart';
import 'package:shoppingmall/screens/onboarding_screen.dart';
import 'feedback_screen.dart';

class WelcomeScreen extends StatelessWidget {
  //const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthProvider>(context);
    bool _validPhoneNumber = false;
    var _phoneNumberController = TextEditingController();

    void showBottomSheet(context) {
      // ... Existing code for showing the bottom sheet ...

      ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.deepPurple),
        ),
        child: RichText(
          text: TextSpan(
            text: 'Already Registered ?',
            style: TextStyle(color: Colors.white70),
            children: [
              TextSpan(
                text: ' Login',
                style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
              )
            ],
          ),
        ),
        onPressed: () {
          showBottomSheet(context);
        },
      );
    }

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Stack(
          children: [
            Positioned(
              right: 0.0,
              top: 20.0,
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Color(0xFFB598E3)),
                ),
                child: Text('SKIP', style: TextStyle(color: Color(0xFF0E0434))),
                onPressed: () {},
              ),
            ),
            Column(
              children: [
                Expanded(
                  child: OnBoardScreen(),
                ),
                Text('Ready to Shopping?'),
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Color(0xFFB598E3)),
                  ),
                  child: Text('Give Your Feedback...', style: TextStyle(color: Colors.black)),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => FeedbackScreen(key: GlobalKey()), // Provide a Key here
                      ),
                    );
                  },
                ),
                SizedBox(height: 20,),
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.deepPurple),
                  ),
                  child: RichText(
                    text: TextSpan(
                      text: 'Already Registered ?',
                      style: TextStyle(color: Colors.white70),
                      children: [
                        TextSpan(
                          text: ' Login',
                          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
                        )
                      ],
                    ),
                  ),
                  onPressed: () {
                    showBottomSheet(context);
                  },
                ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navigate to the ChatbotApp when the button is pressed
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ChatbotApp(),
            ),
          );
        },
        child: Icon(Icons.chat_bubble),
        backgroundColor: Colors.deepPurple, // Customize the button's color
      ),
    );
  }
}

void main() {
  runApp(ChatbotApp());
}

class ChatbotApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.blue,
        colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.blueAccent), // Set your accent color
      ),
      home: ChatScreen(),
    );
  }
}

// Define your ChatScreen, AuthProvider, and other widgets here
