import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ChatScreen(),
      theme: ThemeData(
        primaryColor: Colors.blue, // Set your primary color here
        hintColor: Colors.green, // Set your accent color here
      ),
    );
  }
}

class ChatScreen extends StatefulWidget {
  @override
  State createState() => ChatScreenState();
}

class ChatScreenState extends State<ChatScreen> {
  final List<String> messages = [];
  String currentCategory = "";
  TextEditingController _controller = TextEditingController();

  // Function to handle user input and chatbot responses
  void handleUserInput(String text) {
    setState(() {
      messages.add('User: $text');

      if (currentCategory.isEmpty) {
        // User hasn't selected a category yet, provide category options as buttons.
        if (text.toLowerCase().contains('technical support')) {
          currentCategory = 'Technical Support';
          messages.add('App: You selected Technical Support.');
          messages.add('App: Choose from the following options:');
          messages.add('1. Help with an order');
          messages.add('2. Account issues');
        } else if (text.toLowerCase().contains('other support')) {
          currentCategory = 'Other Support';
          messages.add('App: You selected Other Support.');
          messages.add('App: Choose from the following options:');
          messages.add('1. General inquiries');
          messages.add('2. Feedback');
        } else {
          messages.add('App: I didn\'t understand. Please select "Technical Support" or "Other Support".');
        }
      } else {
        // User has selected a category, handle options within that category.
        if (currentCategory == 'Technical Support') {
          if (text == '1') {
            messages.add('User: 1');
            messages.add('App: You selected "Help with an order".');
            messages.add('App: How can I assist you with your order?');
          } else if (text == '2') {
            messages.add('User: 2');
            messages.add('App: You selected "Account issues".');
            messages.add('App: What account issues are you facing?');
          } else {
            messages.add('App: I didn\'t understand that option. Please select a valid option.');
          }
        } else if (currentCategory == 'Other Support') {
          if (text == '1') {
            messages.add('User: 1');
            messages.add('App: You selected "General inquiries".');
            messages.add('App: Ask any general questions you have.');
          } else if (text == '2') {
            messages.add('User: 2');
            messages.add('App: You selected "Feedback".');
            messages.add('App: Please provide your feedback.');
          } else {
            messages.add('App: I didn\'t understand that option. Please select a valid option.');
          }
        }
      }

      _controller.clear(); // Clear the input field
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shopping Mall Support'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: messages.length,
              itemBuilder: (BuildContext context, int index) {
                if (messages[index].startsWith('App: Choose from the following options:')) {
                  // Create buttons for options
                  final optionList = messages[index].split('\n').sublist(1);
                  return ButtonOptions(options: optionList, onPressed: handleUserInput);
                } else {
                  return ChatBubble(
                    text: messages[index],
                    isUserMessage: messages[index].startsWith('User: '),
                  );
                }
              },
            ),
          ),
          TextField(
            onSubmitted: (String text) {
              handleUserInput(text); // Handle user input here
            },
            decoration: InputDecoration(
              hintText: 'Enter your question...',
              suffixIcon: IconButton(
                icon: Icon(Icons.send),
                onPressed: () {
                  handleUserInput("User: " + _controller.text); // Handle user input here
                },
              ),
            ),
            controller: _controller,
          ),
        ],
      ),
    );
  }
}

class ChatBubble extends StatelessWidget {
  final String text;
  final bool isUserMessage;

  ChatBubble({required this.text, required this.isUserMessage});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: isUserMessage ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: EdgeInsets.all(8.0),
        padding: EdgeInsets.all(12.0),
        decoration: BoxDecoration(
          color: isUserMessage ? Colors.blue : Colors.green, // Customize the colors
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Text(
          text,
          style: TextStyle(color: Colors.white, fontSize: 16.0),
        ),
      ),
    );
  }
}

class ButtonOptions extends StatelessWidget {
  final List<String> options;
  final Function onPressed;

  ButtonOptions({required this.options, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: options.map((option) {
        return ElevatedButton(
          onPressed: () {
            onPressed(option);
          },
          child: Text(option),
        );
      }).toList(),
    );
  }
}
