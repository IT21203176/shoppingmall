import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen ({super.key});
  static const String id = 'login-screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Page'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            showBottomSheet(context);
          },
          child: Text('Show Bottom Sheet'),
        ),
      ),
    );
  }

  void showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) => Container(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('LOGIN', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
              Text('Enter Your Mobile No. to Process', style: TextStyle(fontSize: 12),),
              SizedBox(height: 30,),
              Form(
                child: Column(
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                        prefixText: '+94',
                        helperText: '10-digits',
                      ),
                      autofocus: true,
                      keyboardType: TextInputType.phone,
                      maxLength: 10,
                      validator: (value) {
                        // Add validation logic here if needed
                        return null; // Return null for no validation error
                      },
                    ),
                    SizedBox(height: 20), // Adjust as needed

                    // Add other form fields here

                    ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.deepOrange),
                      ),
                      onPressed: () {
                        // Validate the form
                        if (Form.of(context).validate()) {
                          // Form is valid, perform the submit action here
                          // You can access form fields' values like this:
                          // final phoneValue = phoneController.text;
                          // Perform your submission logic here
                        }
                      },
                      child: Text('Submit', style: TextStyle(color: Colors.black)),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

