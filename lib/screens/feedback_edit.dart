import 'package:flutter/material.dart';

class FeedbackEditDialog extends StatefulWidget {
  final String feedbackDocId;
  final String initialPersonalShoppingAssistant;
  final String initialMostExcitingItem;
  final double initialShoppingSpeed;
  final String initialInnovativeIdeas;

  FeedbackEditDialog({
    required this.feedbackDocId,
    required this.initialPersonalShoppingAssistant,
    required this.initialMostExcitingItem,
    required this.initialShoppingSpeed,
    required this.initialInnovativeIdeas,
  });

  @override
  _FeedbackEditDialogState createState() => _FeedbackEditDialogState();
}

class _FeedbackEditDialogState extends State<FeedbackEditDialog> {
  String personalShoppingAssistant = '';
  String mostExcitingItem = '';
  double shoppingSpeed = 1.0;
  String innovativeIdeas = '';

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    // Initialize the form fields with the initial values
    personalShoppingAssistant = widget.initialPersonalShoppingAssistant;
    mostExcitingItem = widget.initialMostExcitingItem;
    shoppingSpeed = widget.initialShoppingSpeed;
    innovativeIdeas = widget.initialInnovativeIdeas;
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Edit Feedback'),
      content: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('1. Personal Shopping Assistant:'),
              buildRadioGroup(
                options: ['Excellent', 'Average', 'Needs Improvement'],
                selectedValue: personalShoppingAssistant,
                onChanged: (value) {
                  setState(() {
                    personalShoppingAssistant = value!;
                  });
                },
              ),
              SizedBox(height: 16.0),

              Text('2. Product Discovery:'),
              buildRadioGroup(
                options: ['A new fashion trend', 'A great deal or discount', 'None, I stick to my usual purchases'],
                selectedValue: mostExcitingItem,
                onChanged: (value) {
                  setState(() {
                    mostExcitingItem = value!;
                  });
                },
              ),
              SizedBox(height: 16.0),

              Text('3. Shopping Speed:'),
              Slider(
                value: shoppingSpeed,
                onChanged: (value) {
                  setState(() {
                    shoppingSpeed = value;
                  });
                },
                min: 1.0,
                max: 10.0,
                divisions: 9,
                label: shoppingSpeed.toString(),
              ),
              SizedBox(height: 16.0),
              TextFormField(
                initialValue: innovativeIdeas,
                decoration: InputDecoration(
                  labelText: "4. Innovative Ideas For Improve App *", // Add an asterisk to indicate required
                  hintText: "Enter your innovative ideas here",
                ),
                onChanged: (value) {
                  setState(() {
                    innovativeIdeas = value;
                  });
                },
                maxLines: 3,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'This field is required.';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16.0),

              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // Handle form submission here
                    // Combine edited data with the initial data
                    final updatedData = {
                      'personalShoppingAssistant': personalShoppingAssistant,
                      'mostExcitingItem': mostExcitingItem,
                      'shoppingSpeed': shoppingSpeed,
                      'innovativeIdeas': innovativeIdeas,
                    };

                    // Update the data in Firebase
                    // You can use Firebase update logic here
                    updateFirebaseData(updatedData);

                    // Close the dialog
                    Navigator.pop(context);
                  }
                },
                child: Text('Save Changes'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildRadioGroup({
    required List<String> options,
    required String selectedValue,
    void Function(String?)? onChanged,
  }) {
    return Column(
      children: options.map((option) {
        return Row(
          children: [
            Radio<String>(
              value: option,
              groupValue: selectedValue,
              onChanged: onChanged,
            ),
            Text(option),
          ],
        );
      }).toList(),
    );
  }

  void updateFirebaseData(Map<String, dynamic> updatedData) {
    // Implement your logic to update Firebase data here
    // You can use Firebase Firestore for this purpose
    // Example:
    // FirebaseFirestore.instance.collection('feedback').doc(widget.feedbackDocId).update(updatedData);
  }
}
