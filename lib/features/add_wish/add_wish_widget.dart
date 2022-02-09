import 'package:flutter/material.dart';

class AddWishAlert extends StatelessWidget {
  String textInput = '';

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Add New Item'),
      content: TextField(
        decoration: const InputDecoration(hintText: 'Enter your new wish!'),
        onChanged: (value) {
          textInput = value;
        },
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context, textInput);
          },
          child: Text('SUBMIT'),
        ),
      ],
    );
  }
}
