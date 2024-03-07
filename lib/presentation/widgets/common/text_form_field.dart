import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final String hint;
  const TextFieldWidget({super.key,required this.controller,required this.label,required this.hint});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(label),
        TextFormField(
          controller: controller,
          decoration: InputDecoration(
            hintText: hint,
              border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          )),
        ),
      ],
    );
  }
}
