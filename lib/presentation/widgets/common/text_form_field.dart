import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextFieldWidget extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final String? hint;
  final TextInputType? keyboardType;
  const TextFieldWidget(
      {super.key, required this.controller, required this.label, this.hint, this.keyboardType});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 16,
          ),
        ),
        const SizedBox(height: 10),
        TextFormField(
          controller: controller,
          keyboardType: keyboardType,
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: GoogleFonts.inter(
              color: Colors.black.withOpacity(0.4000000059604645),
              fontSize: 14,
              fontWeight: FontWeight.w300,
            ),
            filled: true,
            fillColor: const Color(0x3FD9D9D9),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                width: 0.85,
                color: Colors.black.withOpacity(0.10000000149011612),
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                color: Colors.black.withOpacity(0.10000000149011612),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
